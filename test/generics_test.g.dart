// GENERATED CODE - DO NOT MODIFY BY HAND

part of just_generics_test;

// **************************************************************************
// Generator: SerializableGenerator
// **************************************************************************

abstract class _$GenClassSerializable<T> extends SerializableMap {
  T get data;
  List<T> get list;
  Map<String, T> get mapT;
  void set data(T v);
  void set list(List<T> v);
  void set mapT(Map<String, T> v);

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
        list = __value;
        return;
      case 'mapT':
        mapT = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'GenClass');
  }

  Iterable<String> get keys => const ['data', 'list', 'mapT'];
}
