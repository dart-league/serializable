## 0.14.0

- Upgrade `analyzer` to `^0.40.0`
- Upgrade `built_mirrors` to `^0.13.0`

## 0.13.0

- Upgrade `build_test` to `^1.2.0`
- Upgrade `built_mirrors` to `^0.12.0`

## 0.12.0

- Add `analysis_options` and check for unnecessary `new` and `const` keywords
- Remove dependency on `serializable_core`
- Add dependency to `built_mirrors`
- Change builder from `PartBuilder` to `SharedPartBuilder`, this way generator can run alongside with other generators
- Make builder `auto_apply: dependents`. This way builder only run on direct dependents

## 0.11.3

- upgrade `analyzer` to version `^0.36.0`

## 0.11.2+1

- reorder `SerializableMap` attributes

## 0.11.2

- upgrade `serializable_core` to version `^0.11.2`
- upgrade `analyzer` to version `^0.34.0`

## 0.11.1

- upgrade `analyzer` to version `^0.33.0`
- upgrade `build_runner` to version `^1.0.0`
- upgrade `build` to version `^1.0.1`
- upgrade `built_mirrors_core` to version `^0.10.1`
- upgrade `serializable_core` to version `^0.11.1`

## 0.11.0

- add `from` methods
- upgrade `built_mirrors` to `^0.10.0`
- use `SerializedName` from `built_mirrors`

## 0.10.0

- upgrade `source_gen` to version `^0.9.0`
- upgrade `build_runner` to version `^0.9.0`

## 0.9.3

- upgrade `analyzer` to version `^0.32.0`
- upgrade `build_runner` to version `^0.8.10`
- upgrade `test` to version `^1.0.0`

# 0.9.2

- upgrade `sour_gen` to `^0.8.0`

## 0.9.1

- add generics support

## 0.9.0

- Add missing methods to `SerializableMap`

## 0.8.1

- add `serializable_core` package

## 0.8.0

- upgrade to `built_mirrors@0.7.0`

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
