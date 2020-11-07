import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'serializable.dart';

/// Generates serializable classes from classes annotated with `@Serializable()` or `@serializable`
class SerializableGenerator extends GeneratorForAnnotation<Serializable> {
  final bool useClassMirrors;

  const SerializableGenerator({this.useClassMirrors = false});

  @override
  Future<String> generateForAnnotatedElement(
      covariant ClassElement element, ConstantReader cr, BuildStep buildStep) async {
    if (element is! ClassElement) return '';

    var superTypes = element.allSupertypes.where((st) => st.element.name != 'Object');
    var stAccessors = superTypes.expand((st) => st.accessors);
    var stMethods = superTypes.expand((st) => st.methods);
    var stFields = superTypes.expand((st) => st.element.fields.where((f) => !f.isStatic));

    var methodCheck = (MethodElement e) => !e.isStatic && !e.isOperator;
    var accessorCheck = (ElementKind type) => (a) => a.kind == type && !a.isStatic && !a.isOperator && a.name != 'keys';

    var className = element.name;
    var fields = _distinctByName<FieldElement>(element.fields.where((f) => !f.isStatic).toList()..addAll(stFields));

    var accessors = _distinctByName<PropertyAccessorElement>(element.accessors.toList()..addAll(stAccessors));
    var getters = _distinctByName<PropertyAccessorElement>(accessors.where(accessorCheck(ElementKind.GETTER)));
    var setters = _distinctByName<PropertyAccessorElement>(accessors.where(accessorCheck(ElementKind.SETTER)));
    var methods = _distinctByName<MethodElement>(
        element.methods.where(methodCheck).toList()..addAll(stMethods.where(methodCheck)));
    var typeGenerics = _distinctByName<TypeParameterElement>(element.typeParameters);

    return '''abstract class _\$${className}Serializable${typeGenerics.isNotEmpty ? '<' + typeGenerics.map((x) => x.declaration.name).join(',') + '>' : ''} extends SerializableMap {
  ${element.constructors.where((c) => c.isConst).map((c) => 'const _\$${className}Serializable${c.name.isNotEmpty ? '.' + c.name : ''}();').join('\n')}
  ${getters.map((g) => '${g.returnType.getDisplayString(withNullability: false)} get ${g.name};').join('\n')}
  ${setters.map((s) => 'set ${s.displayName}(${s.type.normalParameterTypes[0].getDisplayString(withNullability: false)} v);').join('\n')}
  ${methods.map((m) => '${m.returnType.getDisplayString(withNullability: false)} ${m.name}(${_renderParameters(m.parameters)});').join('\n')}

  operator [](Object __key) {
    switch(__key) {
      ${getters.map((a) => "case '${_getFieldName(a)}': return ${a.name};").join('\n')}
      ${methods.map((a) => "case '${a.name}': return ${a.name};").join('\n')}
    }
    throwFieldNotFoundException(__key, '$className');
  }

  operator []=(Object __key, __value) {
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
  var requiredParams = parameters.where((p) => p.isNotOptional).map((p) => p.getDisplayString(withNullability: false)).join(',');
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
  if (setterTypeElement is ClassElement && setterTypeElement.isEnum) {
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
    if (_isPrimitiveOrGeneric(setterType)) {
      return 'null';
    } else if (setterType.getDisplayString(withNullability: false) == 'DateTime') {
      return '() => fromSerializedDateTime(__value)';
    } else if (setterType.typeArguments.isEmpty) {
      return '() => ${setterType.getDisplayString(withNullability: false)}(${_renderConstructorParameters(setterType)})';
    } else if (setterType.typeArguments.every(_isPrimitiveOrGeneric)) {
      return '() => ${setterType.getDisplayString(withNullability: false)}()';
    } else {
      return '[() => ${setterType.getDisplayString(withNullability: false)}(),'
          ' ${setterType.typeArguments.map(_renderSetterFactory).join(',')}]';
    }
  } else {
    return 'null';
  }
}

String _renderConstructorParameters(DartType setterType) {
  ClassElement setterClass = setterType.element;
  var constructor = setterClass.unnamedConstructor;
  if (constructor.parameters.isNotEmpty) {
    print('constructor: $constructor');
    if (constructor.parameters.every((p) => setterClass.getField(p.name)?.isFinal ?? false)) {
      return constructor.parameters.map((p) {
        var pf = setterClass.getField(p.name);
        return '__value[\'${_getSerializedNameFromField(pf)}\']';
      }).join(',');
    }
  }

  return '';
}

String _getSerializedNameFromField(FieldElement f) {
  return f.metadata
          .firstWhere((a) => (a.computeConstantValue().type.element as ClassElement).name == 'SerializedName',
              orElse: () => null)
          ?.computeConstantValue()
          ?.getField('name')
          ?.toStringValue() ??
      f.displayName;
}
