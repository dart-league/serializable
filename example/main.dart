import 'dart:convert';

import 'models.dart';

main() {
  var p1 = new Person()
    ..id = 1
    ..name = 'person 1';

  // you can get/set attributes using bracket notations

  print("p1['id']: ${p1['id']}"); // prints `p1['id']: 1`
  print("p1['name']: ${p1['name']}"); //prints `p1['name']: person 1`
  p1['id'] = 1; // will set `p1.id` to `1`
  p1['name'] = 'person 1'; // will set `p1.name` to `person 1`

  try {
    p1['no_existing'];
  } catch (e) {
    print(e); // prints `FieldNotFoundException: The key "no_existing" doesn't exist on class "Person"`
  }

  // you can also use it to convert the object to/from Map

  print('p1.ToMap(): ${p1.toMap()}'); // prints `{id: 1, name: person 1}`
  var p2 = new Person()
    ..fromMap({"id": 2, "name": "person 2", 'address': {'id': 1}});
  print('p2: {id: ${p2.id}, name: ${p2.name}, address.id: ${p2.address
      .id}}'); // prints `p2: {id: 2, name: person 2, address.id: 1}`

  var p3 = new Person()
    ..fromMap({"id": 3, "name": "person 3", 'address': {'id': 3}, 'otherAddresses': [{'id': 4, 'street': 'street 4'}]});
  print('p3: {id: ${p3.id}, name: ${p3.name}, address.id: ${p3.address.id}, otherAddresses[0].street:'
      ' ${p3.otherAddresses[0].street}}'); // prints `p3: {id: 3, name: person 3, address.id: 3}`

  // you can use it to convert the objects to/from JSON using
  // `dart:convert` library directly

  print('p1: ${JSON.encode(p1)}'); // prints `p1: {"id":1,"name":"person 1"}`

  var p4Map = JSON.decode('{"id": 3, "name": "person 3"}');
  var p4 = new Person()
    ..fromMap(p4Map);

  print('p4: {id: ${p4.id}, name: ${p4.name}}'); // prints `p4: {id: 4, name: person 4}`

  new ClassWithMethod()['sayHello']('world'); // prints `Hello world!`
}
