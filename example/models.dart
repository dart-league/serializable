library example.person;

import 'package:serializable/serializable.dart';

part 'models.g.dart';

@serializable
class Person extends _$PersonSerializable {
  int id;
  String name;
}

@serializable
class ClassWithMethod extends _$ClassWithMethodSerializable {
  void someMethod(String p1) {}
}
