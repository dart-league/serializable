# serializable

![Build
Status](https://github.com/dart-league/serializable/actions/workflows/test.yml/badge.svg?branch=master)

This is a library that generates a serializable class from classes
annotated with `@serializable` or `@Serializable()`.

## Getting Started

1 - Create a new dart project.

2 - add `serializable` dependency to your dependencies and
`build_runner` to your dev\_dependencies in the file `pubspec.yaml` .

``` yaml
...
dependencies:
  #...
  serializable: any   # change by the latest dependency
  #...
dev_dependencies:
  #...
  build_runner: any   # change by the latest dependency
  #...
```

3 - create a file in `bin` folder called `models.dart` and put next code
on it:

``` dart
library example.models;

import 'package:serializable/serializable.dart';

part 'models.g.dart';

class SimpleType {
  String id;
  String name;

  SimpleType(this.id, this.name);
}

@serializable
class Person extends SerializableMap with _$PersonSerializable {
  int? id;
  String? name;
  var someDynamic;
  Map? someMap;
  Map<String, int>? otherMap;

  Address? address;

  List<Address>? otherAddresses;

  static final Map<String, SimpleType> list = {
    'minutes': SimpleType('58c42d14f17f33ec6e2020ad', 'minutes'),
    'hours': SimpleType('58c42d26f17f33ec6e2020ae', 'hours'),
    'percent': SimpleType('58c42d4bf17f33ec6e2020b3', 'percent')
  };
}

@serializable
class Address extends SerializableMap with _$AddressSerializable {
  int? id;
  String? street;
  String? zip;
  String? city;
  String? state;
}

@serializable
class ClassWithMethod extends SerializableMap with _$ClassWithMethodSerializable {
  void sayHello(String name) {
    print('Hello $name!');
  }
}
```

4 - create a file in `bin` folder called `main.dart` and put next code
on it:

``` dart
import 'dart:convert';

import 'models.dart';

main() {
  var p1 = Person()
    ..id = 1
    ..name = 'person 1';

  // you can get/set attributes using bracket notations

  print("p1['id']: ${p1['id']}"); // prints `p1['id']: 1`
  print("p1['name']: ${p1['name']}"); //prints `p1['name']: person 1`
  p1['id'] = 1; // will set `p1.id` to `1`
  p1['name'] = 'person 1'; // will set `p1.name` to `person 1`

  try {
    p1['no_existing'];
  } catch (e) {
    print(e); // prints `FieldNotFoundException: The key "no_existing" doesn't exist on class "Person"`
  }

  // you can also use it to convert the object to/from Map

  print('p1.ToMap(): ${p1.toMap()}'); // prints `{id: 1, name: person 1}`
  var p2 = Person()
    ..fromMap({"id": 2, "name": "person 2", 'address': Address()..fromMap({'id': 1})});
  print('p2: {id: ${p2.id}, name: ${p2.name}, address.id: ${p2.address?.id}}'); // prints `p2: {id: 2, name: person 2, address.id: 1}`

  var p3 = Person()
    ..fromMap({
      "id": 3,
      "name": "person 3",
      'address': Address()..fromMap({'id': 3}),
      'otherAddresses': [{'id': 4, 'street': 'street 4'}].map((e) => Address()..fromMap(e)).toList()
    });
  print('p3: {id: ${p3.id}, name: ${p3.name}, address.id: ${p3.address?.id}, otherAddresses[0].street:'
      ' ${p3.otherAddresses?[0].street}}'); // prints `p3: {id: 3, name: person 3, address.id: 3}`

  // you can use it to convert the objects to/from JSON using
  // `dart:convert` library directly

  print('p1: ${jsonEncode(p1)}'); // prints `p1: {"id":1,"name":"person 1"}`

  var p4Map = jsonDecode('{"id": 3, "name": "person 3"}');
  var p4 = Person()
    ..fromMap(p4Map);

  print('p4: {id: ${p4.id}, name: ${p4.name}}'); // prints `p4: {id: 4, name: person 4}`

  ClassWithMethod()['sayHello']('world'); // prints `Hello world!`
}
```

5 - run `pub run build_runner build`. Then you will see that the file
`bin/models.g.dart` has been generated, and it will contain the next
code:

``` dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// SerializableGenerator
// **************************************************************************

mixin _$PersonSerializable on SerializableMap {
  int? get id;
  String? get name;
  dynamic get someDynamic;
  Map<dynamic, dynamic>? get someMap;
  Map<String, int>? get otherMap;
  Address? get address;
  List<Address>? get otherAddresses;
  set id(int? v);
  set name(String? v);
  set someDynamic(dynamic v);
  set someMap(Map<dynamic, dynamic>? v);
  set otherMap(Map<String, int>? v);
  set address(Address? v);
  set otherAddresses(List<Address>? v);

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
      case 'address':
        return address;
      case 'otherAddresses':
        return otherAddresses;
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
      case 'address':
        address = fromSerialized(__value, () => Address());
        return;
      case 'otherAddresses':
        otherAddresses = fromSerialized(__value,
            [() => List<Address>.empty(growable: true), () => Address()]);
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

mixin _$AddressSerializable on SerializableMap {
  int? get id;
  String? get street;
  String? get zip;
  String? get city;
  String? get state;
  set id(int? v);
  set street(String? v);
  set zip(String? v);
  set city(String? v);
  set state(String? v);

  operator [](Object? __key) {
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

  operator []=(Object? __key, __value) {
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

mixin _$ClassWithMethodSerializable on SerializableMap {
  void sayHello(String name);

  operator [](Object? __key) {
    switch (__key) {
      case 'sayHello':
        return sayHello;
    }
    throwFieldNotFoundException(__key, 'ClassWithMethod');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {}
    throwFieldNotFoundException(__key, 'ClassWithMethod');
  }

  Iterable<String> get keys => const [];
}
```

6 - Finally you can run the file `bin/main.dart`. If everything is ok
you will see next output in console:

p1\['id'\]: 1 p1\['name'\]: person 1 FieldNotFoundException: The key
"no\_existing" doesn't exist on class "Person" p1.ToMap(): {id: 1, name:
person 1} p2: {id: 2, name: person 2} p1: {"id":1,"name":"person 1"} p3:
{id: 3, name: person 3}\</programlisting\>
