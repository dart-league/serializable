library example.person;

import 'package:serializable/serializable.dart';

part 'person.g.dart';

@serializable
class Person extends _$PersonSerializable {
  int id;
  String name;
}