# serializable

This is a library that generates a serializable class from classes annotated with
`@serializable` or `@Serializable()`.

## Getting Started

1. Create a new project.
2. add serializable dependency to your `pubspec.yaml`.

```yaml
...
dependencies:
  ...
  serializable: 0.0.1
  ...
```

3. create a file in `bin` folder called `person.dart` and put next code on it:

```dart
library example.person;

import 'package:serializable/serializable.dart';

part 'person.g.dart';

@serializable
class Person extends _$PersonSerializable {
  int id;
  String name;
}
```

4. create a file in `bin` folder called `main.dart` and put next code on it:

```dart
import 'dart:convert';
import 'person.dart';

main() {
  var p1 = new Person()
      ..id = 1
      ..name = 'person 1';

  print(p1['name']);

  print('p1: ${JSON.encode(p1)}');

  var p2Map = JSON.decode('{"id": 2, "name": "person2"}');
  var p2 = new Person()..addAll(p2Map);

  print('p2: {id: ${p2.id}, name: ${p2.name}}');
}
```

5. create a file in `tool` folder called `build.dart` and put next code on it:

```dart
import 'package:build_runner/build_runner.dart';
import 'package:serializable/serializable_phase.dart';


main() async {
  await build(new PhaseGroup()..addPhase(
     serializablePhase('serializable', const ['example/*.dart'])),
      deleteFilesByDefault: true);
}
```

6. run `tool/build.dart`. Then you will see that the file `bin/person.g.dart`
has been generated and it will contains the next code:

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.person;

// **************************************************************************
// Generator: SerializableGenerator
// Target: class Person
// **************************************************************************

abstract class _$PersonSerializable extends ISerializable {
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
    throw new Exception('field not supported');
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
    throw new Exception("The key $key doesn't exist on class Person");
  }

  get keys => const ['id', 'name'];
}
```

7. Finally you can run the file `bin/main.dart`. If everything is ok you will see next
output in console:

```
person 1
p1: {"id":1,"name":"person 1"}
p2: {id: 1, name: person 2}

Process finished with exit code 0
```