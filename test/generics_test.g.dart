// GENERATED CODE - DO NOT MODIFY BY HAND

part of just_generics_test;

// **************************************************************************
// SerializableGenerator
// **************************************************************************

abstract class _$GenClassSerializable<T> extends SerializableMap {
  T get data;
  List<T> get list;
  Map<String, T> get mapT;
  set data(T v);
  set list(List<T> v);
  set mapT(Map<String, T> v);

  operator [](Object __key) {
    switch (__key) {
      case 'data':
        return data;
      case 'list':
        return list;
      case 'mapT':
        return mapT;
    }
    throwFieldNotFoundException(__key, 'GenClass');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'data':
        data = __value;
        return;
      case 'list':
        list = fromSerialized(__value, () => new List<T>());
        return;
      case 'mapT':
        mapT = fromSerialized(__value, () => new Map<String, T>());
        return;
    }
    throwFieldNotFoundException(__key, 'GenClass');
  }

  Iterable<String> get keys => const ['data', 'list', 'mapT'];
}
