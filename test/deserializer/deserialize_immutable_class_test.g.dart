// GENERATED CODE - DO NOT MODIFY BY HAND

part of deserialiazer.deserialize_immutable_class_test;

// **************************************************************************
// SerializableGenerator
// **************************************************************************

abstract class _$ImmutableClassSerializable extends SerializableMap {
  String get name;
  String get renamed;

  operator [](Object __key) {
    switch (__key) {
      case 'name':
        return name;
      case 'the_renamed':
        return renamed;
    }
    throwFieldNotFoundException(__key, 'ImmutableClass');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
    }
    throwFieldNotFoundException(__key, 'ImmutableClass');
  }

  Iterable<String> get keys => const ['name', 'renamed'];
}

abstract class _$ImmutableWithOptionalParametersSerializable
    extends SerializableMap {
  int get id;
  String get name;

  operator [](Object __key) {
    switch (__key) {
      case 'id':
        return id;
      case 'name':
        return name;
    }
    throwFieldNotFoundException(__key, 'ImmutableWithOptionalParameters');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
    }
    throwFieldNotFoundException(__key, 'ImmutableWithOptionalParameters');
  }

  Iterable<String> get keys => const ['id', 'name'];
}

abstract class _$ImmutableClassInvalidParameterSerializable
    extends SerializableMap {
  const _$ImmutableClassInvalidParameterSerializable();
  String get name;

  operator [](Object __key) {
    switch (__key) {
      case 'name':
        return name;
    }
    throwFieldNotFoundException(__key, 'ImmutableClassInvalidParameter');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
    }
    throwFieldNotFoundException(__key, 'ImmutableClassInvalidParameter');
  }

  Iterable<String> get keys => const ['name'];
}

abstract class _$ListWithImmutableClassSerializable extends SerializableMap {
  ImmutableClass get immutable;
  List<ImmutableClass> get immutables;
  void set immutable(ImmutableClass v);
  void set immutables(List<ImmutableClass> v);

  operator [](Object __key) {
    switch (__key) {
      case 'immutable':
        return immutable;
      case 'immutables':
        return immutables;
    }
    throwFieldNotFoundException(__key, 'ListWithImmutableClass');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'immutable':
        immutable = fromSerialized(__value,
            () => new ImmutableClass(__value['name'], __value['the_renamed']));
        return;
      case 'immutables':
        immutables = fromSerialized(__value, [
          () => new List<ImmutableClass>(),
          () => new ImmutableClass(__value['name'], __value['the_renamed'])
        ]);
        return;
    }
    throwFieldNotFoundException(__key, 'ListWithImmutableClass');
  }

  Iterable<String> get keys => const ['immutable', 'immutables'];
}
