import 'dart:convert';
import 'person.dart';

main() {
  var p1 = new Person()
      ..id = 1
      ..name = 'person 1';

  print(p1['name']);

  print('p1: ${JSON.encode(p1)}');

  var p2Map = JSON.decode('{"id": 2, "name": "person 2"}');
  var p2 = new Person()..addAll(p2Map);

  print('p2: {id: ${p2.id}, name: ${p2.name}}');
}