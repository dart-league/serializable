## 0.7.0

- upgrade to `built_mirrors@0.6.0`
- rename `phase.dart` to `action.dart`
- rename `serializablePhase` to `serializableAction`

## 0.6.1

- rename `key` to `__key` and `value` to `__value` in generator

## 0.6.0

- upgrade `built_mirrors` to version `^0.5.0`
- upgrade `build_runner` to version `^0.4.0`
- upgrade `build` to version `^0.10.0`

## 0.5.0

- upgrade `built_mirrors` to version `^0.4.0`
- upgrade `sourge_gen` to version `^0.7.0`

## 0.4.0

- upgrade `built_mirrors` to version `^0.3.0`
- upgrade `sourge_gen` to version `^0.6.0`

## 0.3.3

- upgrade `built_mirrors` to version `^0.2.2`

## 0.3.2

- enhance tests
- add `.travis.yml` file
- skip operators during generation

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
