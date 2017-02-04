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
  Future<String> generateForAnnotatedElement(ClassElement element, Serializable annotation, BuildStep buildStep) async {
    var superTypes = element.allSupertypes.where((st) => st.element.name != 'Object');
    var stAccessors = superTypes.expand((st) => st.accessors);
    var stMethods = superTypes.expand((st) => st.methods);
    var stFields = superTypes.expand((st) => st.element.fields);

    var className = element.name;
    var fields = _distinctByName(element.fields.toList()..addAll(stFields));
    var accessors = _distinctByName(element.accessors.toList()..addAll(stAccessors));
    var getters = _distinctByName(accessors.where((a) => a.kind == ElementKind.GETTER));
    var setters = _distinctByName(accessors.where((a) => a.kind == ElementKind.SETTER));
    List<MethodElement> methods = _distinctByName(element.methods.toList()..addAll(stMethods));



    return '''abstract class _\$${className}Serializable extends SerializableMap {
  ${element.constructors.where((c) => c.isConst)
        .map((c) => 'const _\$${className}Serializable${c.name.isNotEmpty ? '.' + c.name : ''}();')
        .join('\n')
    }
  ${getters.map((g) => 'get ${g.name};').join('\n')}
  ${setters.map((g) => 'set ${g.displayName}(v);').join('\n')}
  ${methods.map((m) => '${m.returnType} ${m.name}(${m.parameters.map((p) => p.computeNode()).join(',')});').join('\n')}

  operator [](String key) {
    switch(key) {
      ${getters.map((a) => "case '${a.name}': return ${a.name};").join('\n')}
      ${methods.map((a) => "case '${a.name}': return ${a.name};").join('\n')}
    }
    throwFieldNotFoundException(key, '$className');
  }

  operator []=(String key, value) {
    switch(key) {
      ${setters.map((a) => "case '${a.displayName}': ${a.displayName} = value; return;").join('\n')}
    }
    throwFieldNotFoundException(key, '$className');
  }

  get keys => ${useClassMirrors
        ? '${className}ClassMirror.fields.keys;'
        : 'const [${fields.map((f) => "'${f.name}'").join(',')}];'}
}''';
  }
}

List<Element> _distinctByName(Iterable<Element> elements) {
  var result = [];
  for (var element in elements) {
    if (!result.any((e) => e.name == element.name)) result.add(element);
  }
  return result;
}