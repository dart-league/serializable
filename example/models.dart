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

  static final Map<String, SimpleType> list = {
    'minutes': new SimpleType('58c42d14f17f33ec6e2020ad', 'minutes'),
    'hours': new SimpleType('58c42d26f17f33ec6e2020ae', 'hours'),
    'percent': new SimpleType('58c42d4bf17f33ec6e2020b3', 'percent')
  };
}

@serializable
class ClassWithMethod extends _$ClassWithMethodSerializable {
  void sayHello(String name) {
    print('Hello $name!');
  }
}
