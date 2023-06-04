library example.models;

import 'package:serializable/serializable.dart';

part 'models.g.dart';

class SimpleType {
  String id;
  String name;

  SimpleType(this.id, this.name);
}

@serializable
class Person extends SerializableMap with _$PersonSerializable {
  int? id;
  String? name;
  var someDynamic;
  Map? someMap;
  Map<String, int>? otherMap;

  Address? address;

  List<Address>? otherAddresses;

  static final Map<String, SimpleType> list = {
    'minutes': SimpleType('58c42d14f17f33ec6e2020ad', 'minutes'),
    'hours': SimpleType('58c42d26f17f33ec6e2020ae', 'hours'),
    'percent': SimpleType('58c42d4bf17f33ec6e2020b3', 'percent')
  };
}

@serializable
class Address extends SerializableMap with _$AddressSerializable {
  int? id;
  String? street;
  String? zip;
  String? city;
  String? state;
}

@serializable
class ClassWithMethod extends SerializableMap with _$ClassWithMethodSerializable {
  void sayHello(String name) {
    print('Hello $name!');
  }
}
