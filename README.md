# serializable

[![Build Status](https://travis-ci.org/dart-league/serializable.svg?branch=master)](https://travis-ci.org/dart-league/serializable)

This is a library that generates a serializable class from classes annotated with
`@serializable` or `@Serializable()`.

## Getting Started

1. Create a new dart project.
2. add `serializable` dependency to your `pubspec.yaml`.

```yaml
...
dependencies:
  ...
  serializable: any
  ...
```

3. create a file in `bin` folder called `models.dart` and put next code on it:

```dart
library example.person;

import 'package:serializable/serializable.dart';

part 'models.g.dart';

class SimpleType {
  String id;
  String name;

  SimpleType(this.id, this.name);
}

@serializable
class Person extends _$PersonSerializable {
  int id;
  String name;
  var someDynamic;
  Map someMap;
  Map<String, int> otherMap;

  Address address;

  List<Address> otherAddresses;

  static final Map<String, SimpleType> list = {
    'minutes': new SimpleType('58c42d14f17f33ec6e2020ad', 'minutes'),
    'hours': new SimpleType('58c42d26f17f33ec6e2020ae', 'hours'),
    'percent': new SimpleType('58c42d4bf17f33ec6e2020b3', 'percent')
  };
}

@serializable
class Address extends _$AddressSerializable {
  int id;
  String street;
  String zip;
  String city;
  String state;
}

@serializable
class ClassWithMethod extends _$ClassWithMethodSerializable {
  void sayHello(String name) {
    print('Hello $name!');
  }
}

```

4. create a file in `bin` folder called `main.dart` and put next code on it:

```dart
import 'dart:convert';

import 'models.dart';

main() {
  var p1 = new Person()
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
  var p2 = new Person()
    ..fromMap({"id": 2, "name": "person 2", 'address': {'id': 1}});
  print('p2: {id: ${p2.id}, name: ${p2.name}, address.id: ${p2.address
      .id}}'); // prints `p2: {id: 2, name: person 2, address.id: 1}`

  var p3 = new Person()
    ..fromMap({"id": 3, "name": "person 3", 'address': {'id': 3}, 'otherAddresses': [{'id': 4, 'street': 'street 4'}]});
  print('p3: {id: ${p3.id}, name: ${p3.name}, address.id: ${p3.address.id}, otherAddresses[0].street:'
      ' ${p3.otherAddresses[0].street}}'); // prints `p3: {id: 3, name: person 3, address.id: 3}`

  // you can use it to convert the objects to/from JSON using
  // `dart:convert` library directly

  print('p1: ${JSON.encode(p1)}'); // prints `p1: {"id":1,"name":"person 1"}`

  var p4Map = JSON.decode('{"id": 3, "name": "person 3"}');
  var p4 = new Person()
    ..fromMap(p4Map);

  print('p4: {id: ${p4.id}, name: ${p4.name}}'); // prints `p4: {id: 4, name: person 4}`

  new ClassWithMethod()['sayHello']('world'); // prints `Hello world!`
}

```

5. create a file in `tool` folder called `build.dart` and put next code on it:

```dart
import 'package:build_runner/build_runner.dart';
import 'package:serializable/action.dart';


main() async {
  // In next line replace `example/*.dart` for the globs you want to use as input, for example `**/*.dart`
  // to take all the dart files of the project as input.
  await build([serializableAction(const ['example/*.dart'])],deleteFilesByDefault: true);
}

```

6. run `tool/build.dart`. Then you will see that the file `bin/models.g.dart`
has been generated and it will contains the next code:

```dart
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
  Address get address;
  List<Address> get otherAddresses;
  void set id(int v);
  void set name(String v);
  void set someDynamic(dynamic v);
  void set someMap(Map<dynamic, dynamic> v);
  void set otherMap(Map<String, int> v);
  void set address(Address v);
  void set otherAddresses(List<Address> v);

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
        someMap = __value;
        return;
      case 'otherMap':
        otherMap = __value;
        return;
      case 'address':
        address = __value;
        return;
      case 'otherAddresses':
        otherAddresses = __value;
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
  void set id(int v);
  void set street(String v);
  void set zip(String v);
  void set city(String v);
  void set state(String v);

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

```

7. Finally you can run the file `bin/main.dart`. If everything is ok you will see next
output in console:

```
p1['id']: 1
p1['name']: person 1
FieldNotFoundException: The key "no_existing" doesn't exist on class "Person"
p1.ToMap(): {id: 1, name: person 1}
p2: {id: 2, name: person 2}
p1: {"id":1,"name":"person 1"}
p3: {id: 3, name: person 3}
```