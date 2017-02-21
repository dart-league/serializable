library example.person;

import 'package:serializable/serializable.dart';

part 'models.g.dart';

@serializable
class Person extends _$PersonSerializable {
  int id;
  String name;
  var someDynamic;
  Map someMap;
  Map<String, int> otherMap;
}

@serializable
class ClassWithMethod extends _$ClassWithMethodSerializable {
  void someMethod(String p1) {}
}
