import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'serializable.dart';

/// Generates serializable classes from classes annotated with `@Serializable()` or `@serializable`
class SerializableGenerator extends GeneratorForAnnotation<Serializable> {
  final bool useClassMirrors;

  const SerializableGenerator({this.useClassMirrors = false});

  @override
  Future<String> generateForAnnotatedElement(covariant ClassElement element, ConstantReader cr, BuildStep buildStep) async {
    var superTypes = element.allSupertypes.where((st) => st.element.name != 'Object');
    var stAccessors = superTypes.expand((st) => st.accessors);
    var stMethods = superTypes.expand((st) => st.methods);
    var stFields = superTypes.expand((st) => st.element.fields.where((f) => !f.isStatic));

    var methodCheck = (MethodElement e) => !e.isStatic && !e.isOperator;
    var accessorCheck = (ElementKind type) => (a) => a.kind == type && !a.isStatic && !a.isOperator && a.name != 'keys';

    var className = element.name;
    var fields = _distinctByName(element.fields.where((f) => !f.isStatic).toList()..addAll(stFields));
    var accessors = _distinctByName<PropertyAccessorElement>(element.accessors.toList()..addAll(stAccessors));
    var getters = _distinctByName<PropertyAccessorElement>(
      accessors.where(accessorCheck(ElementKind.GETTER)));
    var setters = _distinctByName<PropertyAccessorElement>(
      accessors.where(accessorCheck(ElementKind.SETTER)));
    var methods = _distinctByName<MethodElement>(
      element.methods.where(methodCheck).toList()
        ..addAll(stMethods.where(methodCheck)));



    return '''abstract class _\$${className}Serializable extends SerializableMap {
  ${element.constructors.where((c) => c.isConst)
        .map((c) => 'const _\$${className}Serializable${c.name.isNotEmpty ? '.' + c.name : ''}();')
        .join('\n')
    }
  ${getters.map((g) => '${g.returnType} get ${g.name};').join('\n')}
  ${setters.map((s) => 'void set ${s.displayName}(${s.type.normalParameterTypes[0]} v);').join('\n')}
  ${methods.map((m) => '${m.returnType} ${m.name}(${m.parameters.map((p) => p.computeNode()).join(',')});').join('\n')}

  operator [](Object __key) {
    switch(__key) {
      ${getters.map((a) => "case '${a.name}': return ${a.name};").join('\n')}
      ${methods.map((a) => "case '${a.name}': return ${a.name};").join('\n')}
    }
    throwFieldNotFoundException(__key, '$className');
  }

  operator []=(Object __key, __value) {
    switch(__key) {
      ${setters.map((a) => "case '${a.displayName}': ${a.displayName} = __value; return;").join('\n')}
    }
    throwFieldNotFoundException(__key, '$className');
  }

  Iterable<String> get keys => ${useClassMirrors
        ? '${className}ClassMirror.fields.keys;'
        : 'const [${fields.map((f) => "'${f.name}'").join(',')}];'}
}''';
  }
}

List<T> _distinctByName<T extends Element>(Iterable<T> elements) {
  var result = <T>[];
  for (var element in elements) {
    if (!result.any((e) => e.name == element.name)) result.add(element);
  }
  return result;
}
