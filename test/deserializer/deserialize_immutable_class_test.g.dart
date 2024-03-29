// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deserialize_immutable_class_test.dart';

// **************************************************************************
// SerializableGenerator
// **************************************************************************

mixin _$ImmutableClassSerializable on SerializableMap {
  String get name;
  String get renamed;

  operator [](Object? __key) {
    switch (__key) {
      case 'name':
        return name;
      case 'the_renamed':
        return renamed;
    }
    throwFieldNotFoundException(__key, 'ImmutableClass');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {}
    throwFieldNotFoundException(__key, 'ImmutableClass');
  }

  Iterable<String> get keys => const ['name', 'renamed'];
}

mixin _$ImmutableWithOptionalParametersSerializable on SerializableMap {
  int? get id;
  String? get name;

  operator [](Object? __key) {
    switch (__key) {
      case 'id':
        return id;
      case 'name':
        return name;
    }
    throwFieldNotFoundException(__key, 'ImmutableWithOptionalParameters');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {}
    throwFieldNotFoundException(__key, 'ImmutableWithOptionalParameters');
  }

  Iterable<String> get keys => const ['id', 'name'];
}

mixin _$ImmutableClassInvalidParameterSerializable on SerializableMap {
  String? get name;

  operator [](Object? __key) {
    switch (__key) {
      case 'name':
        return name;
    }
    throwFieldNotFoundException(__key, 'ImmutableClassInvalidParameter');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {}
    throwFieldNotFoundException(__key, 'ImmutableClassInvalidParameter');
  }

  Iterable<String> get keys => const ['name'];
}

mixin _$ListWithImmutableClassSerializable on SerializableMap {
  ImmutableClass? get immutable;
  List<ImmutableClass>? get immutables;
  set immutable(ImmutableClass? v);
  set immutables(List<ImmutableClass>? v);

  operator [](Object? __key) {
    switch (__key) {
      case 'immutable':
        return immutable;
      case 'immutables':
        return immutables;
    }
    throwFieldNotFoundException(__key, 'ListWithImmutableClass');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {
      case 'immutable':
        immutable = fromSerialized(__value,
            () => ImmutableClass(__value['name'], __value['the_renamed']));
        return;
      case 'immutables':
        immutables = fromSerialized(__value, [
          () => List<ImmutableClass>.empty(growable: true),
          () => ImmutableClass(__value['name'], __value['the_renamed'])
        ]);
        return;
    }
    throwFieldNotFoundException(__key, 'ListWithImmutableClass');
  }

  Iterable<String> get keys => const ['immutable', 'immutables'];
}
