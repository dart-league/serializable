## 0.3.1

- make generator ignore static types

## 0.3.0

- remove `packageName` parameter from `phase`
- upgrade `built_mirrors` to version `^0.2.0`
- upgrade `build_test` to version `^0.5.0`

## 0.2.1

- correct types for using with strong-mode.

## 0.2.0

-  add ability to get methods using strings, for example:
```dart
var sayHello = person['sayHello']; // will return `person.sayHello`
```

## 0.1.2

- upgrade dependencies

## 0.1.1
   
- `Serializable` annotation now extends `Reflectable`
- add const constructor to `SerializableMap`
- add const constructor template to `SerializableGenerator`

## 0.1.0

- change name from `ISerializable` to `SerializableMap`
- add `FieldNotFoundError`
- rename `serializable_phase.dart` to `phase.dart`
- rename `serializable_generator.dart` to `generator.dart`

## 0.0.2

- add `toMap` adn `fromMap` methods to `ISerializable`

## 0.0.1

- Initial version
