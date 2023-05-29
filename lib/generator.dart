import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:collection/collection.dart';

import 'serializable.dart';

/// Generates serializable classes from classes annotated with `@Serializable()` or `@serializable`
class SerializableGenerator extends GeneratorForAnnotation<Serializable> {
  final bool useClassMirrors;

  const SerializableGenerator({this.useClassMirrors = false});

  @override
  Future<String> generateForAnnotatedElement(
      covariant ClassElement element, ConstantReader cr, BuildStep buildStep) async {

    var superTypes = element.allSupertypes.where((st) => st.element.name != 'Object');
    var stAccessors = superTypes.expand((st) => st.accessors);
    var stMethods = superTypes.expand((st) => st.methods);
    var stFields = superTypes.expand((st) => st.element.fields.where((f) => !f.isStatic));

    var methodCheck = (MethodElement e) => !e.isStatic && !e.isOperator;
    var accessorCheck = (ElementKind type) => (a) => a.kind == type && !a.isStatic && !a.isOperator && a.name != 'keys';

    var className = element.name;
    var fields = []
      ..addAll(_distinctByName<FieldElement>(element.fields.where((f) => !f.isStatic))
      ..addAll(stFields));

    var accessors = _distinctByName<PropertyAccessorElement>([...element.accessors, ...stAccessors]);
    var getters = _distinctByName<PropertyAccessorElement>(accessors.where(accessorCheck(ElementKind.GETTER)));
    var setters = _distinctByName<PropertyAccessorElement>(accessors.where(accessorCheck(ElementKind.SETTER)));
    var methods = _distinctByName<MethodElement>([...element.methods.where(methodCheck), ...stMethods.where(methodCheck)]);
    var typeGenerics = _distinctByName<TypeParameterElement>(element.typeParameters);

    return '''abstract class _\$${className}Serializable${typeGenerics.isNotEmpty ? '<' + typeGenerics.map((x) => x.declaration.name).join(',') + '>' : ''} extends SerializableMap {
  ${element.constructors.where((c) => c.isConst).map((c) => 'const _\$${className}Serializable${c.name.isNotEmpty ? '.' + c.name : ''}();').join('\n')}
  ${getters.map((g) => '${g.returnType.getDisplayString(withNullability: true)} get ${g.name};').join('\n')}
  ${setters.map((s) => 'set ${s.displayName}(${s.type.normalParameterTypes[0].getDisplayString(withNullability: true)} v);').join('\n')}
  ${methods.map((m) => '${m.returnType.getDisplayString(withNullability: true)} ${m.name}(${_renderParameters(m.parameters)});').join('\n')}

  operator [](Object? __key) {
    switch(__key) {
      ${getters.map((a) => "case '${_getFieldName(a)}': return ${a.name};").join('\n')}
      ${methods.map((a) => "case '${a.name}': return ${a.name};").join('\n')}
    }
    throwFieldNotFoundException(__key, '$className');
  }

  operator []=(Object? __key, __value) {
    switch(__key) {
      ${setters.map((a) => "case '${_getFieldName(a)}': ${a.displayName} = ${_renderSetterValue(a)}; return;").join('\n')}
    }
    throwFieldNotFoundException(__key, '$className');
  }

  Iterable<String> get keys => ${useClassMirrors ? '${className}ClassMirror.fields.keys;' : 'const [${fields.map((f) => "'${f.name}'").join(',')}];'}
}''';
  }
}

_getFieldName(PropertyAccessorElement a) {
  var f = (a.enclosingElement as ClassElement).getField(a.displayName);
  return _getSerializedNameFromField(f);
}

List<T> _distinctByName<T extends Element>(Iterable<T> elements) {
  var result = <T>[];
  for (var element in elements) {
    if (!result.any((e) => e.name == element.name)) result.add(element);
  }
  return result;
}

String _renderParameters(List<ParameterElement> parameters) {
  var aux = [];
  var requiredParams = parameters.where((p) => p.isRequired).map((p) => p.getDisplayString(withNullability: false)).join(',');
  if (requiredParams.isNotEmpty) aux.add(requiredParams);
  var positionalParams = parameters.where((p) => p.isOptionalPositional).map((p) => p.toString()).join(',');
  if (positionalParams.isNotEmpty) aux.add('[$positionalParams]');
  var namedParams = parameters.where((p) => p.isNamed).map((p) => p.toString()).join(',');
  if (namedParams.isNotEmpty) aux.add('{$namedParams}');
  return aux.join(',');
}

String _renderSetterValue(PropertyAccessorElement setter) {
  var setterType = setter.parameters[0].type;
  var setterTypeElement = setterType.element;
  if (setterTypeElement is EnumElement) {
    return 'fromSerializedEnum(__value, ${setterType.getDisplayString(withNullability: false)}, () => ${setterType.getDisplayString(withNullability: false)}.values)';
  }

  if (_isPrimitiveOrGeneric(setterType)) {
    return '__value';
  } else if (setterType.getDisplayString(withNullability: false) == 'DateTime') {
    return 'fromSerializedDateTime(__value)';
  } else {
    return 'fromSerialized(__value, ${_renderSetterFactory(setterType)})';
  }
}

bool _isPrimitive(DartType type) =>
    ['bool', 'int', 'num', 'double', 'String', 'BigInt', 'dynamic', 'Object']
        .any((e) => e == type.getDisplayString(withNullability: false));

bool _isPrimitiveOrGeneric(DartType type) => _isPrimitive(type) || type is TypeParameterType;

String _renderSetterFactory(DartType setterType) {
  if (setterType is ParameterizedType) {
    var setterDisplayString = setterType.getDisplayString(withNullability: false);
    if (_isPrimitiveOrGeneric(setterType)) {
      return 'null';
    } else if (setterDisplayString == 'DateTime') {
      return '() => fromSerializedDateTime(__value)';
    } else if (setterType.typeArguments.isEmpty) {
      return '() => ${setterDisplayString}(${_renderConstructorParameters(setterType)})';
    } else if (setterType.typeArguments.every(_isPrimitiveOrGeneric)) {
      return '() => ${setterDisplayString.startsWith('List') ? '${setterDisplayString}.empty(growable: true)' : '${setterDisplayString}()'}';
    } else {
      return '[() => ${setterDisplayString.startsWith('List') ? '${setterDisplayString}.empty(growable: true)' : '${setterDisplayString}()'},'
          ' ${setterType.typeArguments.map(_renderSetterFactory).join(',')}]';
    }
  } else {
    return 'null';
  }
}

String? _renderConstructorParameters(DartType setterType) {
  var setterClass = setterType.element as ClassElement?;
  var constructor = setterClass?.unnamedConstructor;
  var parameters = constructor?.parameters;
  if (parameters?.isNotEmpty == true) {
    print('constructor: $constructor');
    if (parameters?.every((p) => setterClass?.getField(p.name)?.isFinal ?? false) == true) {
      return parameters?.map((p) {
        var pf = setterClass?.getField(p.name);
        return '__value[\'${_getSerializedNameFromField(pf)}\']';
      }).join(',');
    }
  }

  return '';
}

String? _getSerializedNameFromField(FieldElement? f) {
  return f?.metadata
          .firstWhereOrNull((a) => (a.computeConstantValue()?.type?.element as ClassElement?)?.name == 'SerializedName')
          ?.computeConstantValue()
          ?.getField('name')
          ?.toStringValue() ??
      f?.displayName;
}
