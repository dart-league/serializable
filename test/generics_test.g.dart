// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generics_test.dart';

// **************************************************************************
// SerializableGenerator
// **************************************************************************

mixin _$GenClassSerializable<T1> on SerializableMap {
  T1? get data;
  List<T1>? get list;
  Map<String, T1>? get mapT;
  set data(T1? v);
  set list(List<T1>? v);
  set mapT(Map<String, T1>? v);

  operator [](Object? __key) {
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

  operator []=(Object? __key, __value) {
    switch (__key) {
      case 'data':
        data = __value;
        return;
      case 'list':
        list = fromSerialized(__value, () => List<T1>.empty(growable: true));
        return;
      case 'mapT':
        mapT = fromSerialized(__value, () => Map<String, T1>());
        return;
    }
    throwFieldNotFoundException(__key, 'GenClass');
  }

  Iterable<String> get keys => const ['data', 'list', 'mapT'];
}
