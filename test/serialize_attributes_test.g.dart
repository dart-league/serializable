// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serialize_attributes_test.dart';

// **************************************************************************
// SerializableGenerator
// **************************************************************************

mixin _$PersonSerializable on SerializableMap {
  int? get id;
  String? get name;
  dynamic get someDynamic;
  Map<dynamic, dynamic>? get someMap;
  Map<String, int>? get otherMap;
  set id(int? v);
  set name(String? v);
  set someDynamic(dynamic v);
  set someMap(Map<dynamic, dynamic>? v);
  set otherMap(Map<String, int>? v);

  operator [](Object? __key) {
    switch (__key) {
      case 'id':
        return id;
      case 'name':
        return name;
      case 'someDynamic':
        return someDynamic;
      case 'someMap':
        return someMap;
      case 'otherMap':
        return otherMap;
    }
    throwFieldNotFoundException(__key, 'Person');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {
      case 'id':
        id = __value;
        return;
      case 'name':
        name = __value;
        return;
      case 'someDynamic':
        someDynamic = __value;
        return;
      case 'someMap':
        someMap = fromSerialized(__value, () => Map<dynamic, dynamic>());
        return;
      case 'otherMap':
        otherMap = fromSerialized(__value, () => Map<String, int>());
        return;
    }
    throwFieldNotFoundException(__key, 'Person');
  }

  Iterable<String> get keys =>
      const ['id', 'name', 'someDynamic', 'someMap', 'otherMap'];
}

mixin _$ClassWithMethodSerializable on SerializableMap {
  int sum5(int val);

  operator [](Object? __key) {
    switch (__key) {
      case 'sum5':
        return sum5;
    }
    throwFieldNotFoundException(__key, 'ClassWithMethod');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {}
    throwFieldNotFoundException(__key, 'ClassWithMethod');
  }

  Iterable<String> get keys => const [];
}

mixin _$ClassWithOperatorSerializable on SerializableMap {
  int get val;
  set val(int v);

  operator [](Object? __key) {
    switch (__key) {
      case 'val':
        return val;
    }
    throwFieldNotFoundException(__key, 'ClassWithOperator');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {
      case 'val':
        val = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'ClassWithOperator');
  }

  Iterable<String> get keys => const ['val'];
}

mixin _$ClassWithStaticsSerializable on SerializableMap {
  operator [](Object? __key) {
    switch (__key) {}
    throwFieldNotFoundException(__key, 'ClassWithStatics');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {}
    throwFieldNotFoundException(__key, 'ClassWithStatics');
  }

  Iterable<String> get keys => const [];
}
