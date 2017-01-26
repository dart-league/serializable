import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'serializable.dart';

/// Generates serializable classes from classes annotated with `@Serializable()` or `@serializable`
class SerializableGenerator extends GeneratorForAnnotation<Serializable> {
  const SerializableGenerator();

  @override
  Future<String> generateForAnnotatedElement(ClassElement element, Serializable annotation, BuildStep buildStep) async {
    var accessors = element.accessors;
    var getters = accessors.where((a) => a.kind == ElementKind.GETTER);
    var setters = accessors.where((a) => a.kind == ElementKind.SETTER);

    return '''abstract class _\$${element.name}Serializable extends SerializableMap {
  ${getters.map((g) => 'get ${g.name}').join(';\n')};
  ${setters.map((g) => 'set ${g.displayName}(v)').join(';\n')};

  operator [](String key) {
    switch(key) {
      ${getters.map((a) => "case '${a.name}': return ${a.name};").join('\n')}
    }
    throwFieldNotFoundException(key, "${element.name}");
  }

  operator []=(String key, value) {
    switch(key) {
      ${setters.map((a) => "case '${a.displayName}': ${a.displayName} = value; return;").join('\n')}
    }
    throwFieldNotFoundException(key, "${element.name}");
  }

  get keys => const [${element.fields.map((f) => "'${f.name}'").join(',')}];
}''';
  }
}