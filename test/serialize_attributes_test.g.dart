// GENERATED CODE - DO NOT MODIFY BY HAND

part of serialize_attributes_test;

// **************************************************************************
// Generator: SerializableGenerator
// **************************************************************************

abstract class _$PersonSerializable extends SerializableMap {
  int get id;
  String get name;
  dynamic get someDynamic;
  Map<dynamic, dynamic> get someMap;
  Map<String, int> get otherMap;
  void set id(int v);
  void set name(String v);
  void set someDynamic(dynamic v);
  void set someMap(Map<dynamic, dynamic> v);
  void set otherMap(Map<String, int> v);

  operator [](Object __key) {
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

  operator []=(Object __key, __value) {
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
        someMap = __value;
        return;
      case 'otherMap':
        otherMap = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'Person');
  }

  Iterable<String> get keys =>
      const ['id', 'name', 'someDynamic', 'someMap', 'otherMap'];
}

abstract class _$ClassWithMethodSerializable extends SerializableMap {
  int sum5(int val);

  operator [](Object __key) {
    switch (__key) {
      case 'sum5':
        return sum5;
    }
    throwFieldNotFoundException(__key, 'ClassWithMethod');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
    }
    throwFieldNotFoundException(__key, 'ClassWithMethod');
  }

  Iterable<String> get keys => const [];
}

abstract class _$ClassWithOperatorSerializable extends SerializableMap {
  int get val;
  void set val(int v);

  operator [](Object __key) {
    switch (__key) {
      case 'val':
        return val;
    }
    throwFieldNotFoundException(__key, 'ClassWithOperator');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'val':
        val = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'ClassWithOperator');
  }

  Iterable<String> get keys => const ['val'];
}

abstract class _$ClassWithStaticsSerializable extends SerializableMap {
  operator [](Object __key) {
    switch (__key) {
    }
    throwFieldNotFoundException(__key, 'ClassWithStatics');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
    }
    throwFieldNotFoundException(__key, 'ClassWithStatics');
  }

  Iterable<String> get keys => const [];
}
