// GENERATED CODE - DO NOT MODIFY BY HAND

part of serialize_attributes_test;

// **************************************************************************
// Generator: SerializableGenerator
// Target: class Person
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

  operator [](Object key) {
    switch (key) {
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
    throwFieldNotFoundException(key, 'Person');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'id':
        id = value;
        return;
      case 'name':
        name = value;
        return;
      case 'someDynamic':
        someDynamic = value;
        return;
      case 'someMap':
        someMap = value;
        return;
      case 'otherMap':
        otherMap = value;
        return;
    }
    throwFieldNotFoundException(key, 'Person');
  }

  Iterable<String> get keys =>
      const ['id', 'name', 'someDynamic', 'someMap', 'otherMap'];
}

// **************************************************************************
// Generator: SerializableGenerator
// Target: class ClassWithMethod
// **************************************************************************

abstract class _$ClassWithMethodSerializable extends SerializableMap {
  int sum5(int val);

  operator [](Object key) {
    switch (key) {
      case 'sum5':
        return sum5;
    }
    throwFieldNotFoundException(key, 'ClassWithMethod');
  }

  operator []=(Object key, value) {
    switch (key) {
    }
    throwFieldNotFoundException(key, 'ClassWithMethod');
  }

  Iterable<String> get keys => const [];
}

// **************************************************************************
// Generator: SerializableGenerator
// Target: class ClassWithOperator
// **************************************************************************

abstract class _$ClassWithOperatorSerializable extends SerializableMap {
  int get val;
  void set val(int v);

  operator [](Object key) {
    switch (key) {
      case 'val':
        return val;
    }
    throwFieldNotFoundException(key, 'ClassWithOperator');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'val':
        val = value;
        return;
    }
    throwFieldNotFoundException(key, 'ClassWithOperator');
  }

  Iterable<String> get keys => const ['val'];
}

// **************************************************************************
// Generator: SerializableGenerator
// Target: class ClassWithStatics
// **************************************************************************

abstract class _$ClassWithStaticsSerializable extends SerializableMap {
  operator [](Object key) {
    switch (key) {
    }
    throwFieldNotFoundException(key, 'ClassWithStatics');
  }

  operator []=(Object key, value) {
    switch (key) {
    }
    throwFieldNotFoundException(key, 'ClassWithStatics');
  }

  Iterable<String> get keys => const [];
}
