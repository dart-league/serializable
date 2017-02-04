// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.person;

// **************************************************************************
// Generator: SerializableGenerator
// Target: class Person
// **************************************************************************

abstract class _$PersonSerializable extends SerializableMap {
  get id;
  get name;
  set id(v);
  set name(v);

  operator [](String key) {
    switch (key) {
      case 'id':
        return id;
      case 'name':
        return name;
    }
    throwFieldNotFoundException(key, 'Person');
  }

  operator []=(String key, value) {
    switch (key) {
      case 'id':
        id = value;
        return;
      case 'name':
        name = value;
        return;
    }
    throwFieldNotFoundException(key, 'Person');
  }

  get keys => const ['id', 'name'];
}

// **************************************************************************
// Generator: SerializableGenerator
// Target: class ClassWithMethod
// **************************************************************************

abstract class _$ClassWithMethodSerializable extends SerializableMap {
  void someMethod(String p1);

  operator [](String key) {
    switch (key) {
      case 'someMethod':
        return someMethod;
    }
    throwFieldNotFoundException(key, 'ClassWithMethod');
  }

  operator []=(String key, value) {
    switch (key) {
    }
    throwFieldNotFoundException(key, 'ClassWithMethod');
  }

  get keys => const [];
}
