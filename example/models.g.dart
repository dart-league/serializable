// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.person;

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

abstract class _$ClassWithMethodSerializable extends SerializableMap {
  void sayHello(String name);

  operator [](Object key) {
    switch (key) {
      case 'sayHello':
        return sayHello;
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
