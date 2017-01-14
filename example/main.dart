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