// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.models;

// **************************************************************************
// SerializableGenerator
// **************************************************************************

abstract class _$PersonSerializable extends SerializableMap {
  int get id;
  String get name;
  dynamic get someDynamic;
  Map<dynamic, dynamic> get someMap;
  Map<String, int> get otherMap;
  Address get address;
  List<Address> get otherAddresses;
  set id(int v);
  set name(String v);
  set someDynamic(dynamic v);
  set someMap(Map<dynamic, dynamic> v);
  set otherMap(Map<String, int> v);
  set address(Address v);
  set otherAddresses(List<Address> v);

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
      case 'address':
        return address;
      case 'otherAddresses':
        return otherAddresses;
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
        someMap = fromSerialized(__value, () => new Map<dynamic, dynamic>());
        return;
      case 'otherMap':
        otherMap = fromSerialized(__value, () => new Map<String, int>());
        return;
      case 'address':
        address = fromSerialized(__value, () => new Address());
        return;
      case 'otherAddresses':
        otherAddresses = fromSerialized(
            __value, [() => new List<Address>(), () => new Address()]);
        return;
    }
    throwFieldNotFoundException(__key, 'Person');
  }

  Iterable<String> get keys => const [
        'id',
        'name',
        'someDynamic',
        'someMap',
        'otherMap',
        'address',
        'otherAddresses'
      ];
}

abstract class _$AddressSerializable extends SerializableMap {
  int get id;
  String get street;
  String get zip;
  String get city;
  String get state;
  set id(int v);
  set street(String v);
  set zip(String v);
  set city(String v);
  set state(String v);

  operator [](Object __key) {
    switch (__key) {
      case 'id':
        return id;
      case 'street':
        return street;
      case 'zip':
        return zip;
      case 'city':
        return city;
      case 'state':
        return state;
    }
    throwFieldNotFoundException(__key, 'Address');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'id':
        id = __value;
        return;
      case 'street':
        street = __value;
        return;
      case 'zip':
        zip = __value;
        return;
      case 'city':
        city = __value;
        return;
      case 'state':
        state = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'Address');
  }

  Iterable<String> get keys => const ['id', 'street', 'zip', 'city', 'state'];
}

abstract class _$ClassWithMethodSerializable extends SerializableMap {
  void sayHello(String name);

  operator [](Object __key) {
    switch (__key) {
      case 'sayHello':
        return sayHello;
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
