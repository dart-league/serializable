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

  // you can get/set attributes using bracket notations

  print("p1['id']: ${p1['id']}"); // prints `p1['id']: 1`
  print("p1['name']: ${p1['name']}"); //prints `p1['name']: person 1`
  p1['id'] = 1;  // will set `p1.id` to `1`
  p1['name'] = 'person 1'; // will set `p1.name` to `person 1`

  // you can also use it to convert the object to/from Map

  print('p1.ToMap(): ${p1.toMap()}'); // prints `{id: 1, name: person 1}`
  var p2 = new Person()..fromMap({"id": 2, "name": "person 2"});
  print('p2: {id: ${p2.id}, name: ${p2.name}}'); // prints `p2: {id: 2, name: person 2}`

  // you can use it to convert the objects to/from JSON using
  // `dart:convert` library directly

  print('p1: ${JSON.encode(p1)}'); // prints `p1: {"id":1,"name":"person 1"}`

  var p3Map = JSON.decode('{"id": 3, "name": "person 3"}');
  var p3 = new Person()..fromMap(p3Map);

  print('p3: {id: ${p3.id}, name: ${p3.name}}'); // prints `p3: {id: 3, name: person 3}`
}
```

5. create a file in `tool` folder called `build.dart` and put next code on it:

```dart
import 'package:build_runner/build_runner.dart';
import 'package:serializable/serializable_phase.dart';


main() async {
  await build(new PhaseGroup()..addPhase(
    // In next line replace `your_package_name` for the name of your package
    // and `['bin/*.dart']` for the globs you want to use as input, for example `**/*.dart`
    // to take all the dart files of the project as input.
    serializablePhase('your_package_name', const ['bin/*.dart'])),
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