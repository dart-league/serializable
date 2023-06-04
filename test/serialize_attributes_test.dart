library serialize_attributes_test;

import 'package:serializable/serializable.dart';
import 'package:test/test.dart';
import 'dart:convert';

part 'serialize_attributes_test.g.dart';

@serializable
class Person extends SerializableMap with _$PersonSerializable {
  int? id;
  String? name;
  var someDynamic;
  Map? someMap;
  Map<String, int>? otherMap;
}


@serializable
class ClassWithMethod extends SerializableMap with _$ClassWithMethodSerializable {
  int sum5(int val) => val + 5;
}

@serializable
class ClassWithOperator extends SerializableMap with _$ClassWithOperatorSerializable {
  int val = 0;

  num operator +(_val) => val + _val;
}

@serializable
class ClassWithStatics extends SerializableMap with _$ClassWithStaticsSerializable {
  static int val = 5;

  static someMethod() {
    print('hello');
  }
}

main() {
  test('serialize attributes', () {
    var p1 = Person()
      ..id = 1
      ..name = 'person 1'
      ..someDynamic = 1.1
      ..someMap = {'foo': 'bar'}
      ..otherMap = {'foo': 1};

    expect(p1['id'], p1.id);
    expect(p1['name'], p1.name);
    expect(p1['someDynamic'], p1.someDynamic);
    expect(p1['someMap'], p1.someMap);
    expect(p1['otherMap'], p1.otherMap);
    expect(p1.toMap(), {
      'id': p1.id,
      'name': p1.name,
      'someDynamic': p1.someDynamic,
      'someMap': p1.someMap,
      'otherMap': p1.otherMap
    });

    expect(() => p1['no_existing'], throwsA(TypeMatcher<FieldNotFoundException>()));

    expect(jsonEncode(p1), '{"id":1,"name":"person 1","someDynamic":1.1,"someMap":{"foo":"bar"},"otherMap":{"foo":1}}');

    var p2 = Person()
      ..fromMap(jsonDecode('{"id":2,"name":"person 2","someDynamic":2.2,"someMap":{"foo":"bar"},"otherMap":{"foo":2}}'));
    expect(p2.id, 2);
    expect(p2.name, 'person 2');
    expect(p2.someDynamic, 2.2);
    expect(p2.someMap, {'foo': 'bar'});
    expect(p2.otherMap, {'foo': 2});
  });

  test('serialize methods', () {
    var cwm = ClassWithMethod();
    expect(cwm['sum5'](5), 10);
  });

  test("don't serialize operator methods", () {
    var cwo = ClassWithOperator()
      ..val = 5;

    expect(() => cwo['operator+'], throwsA(TypeMatcher<FieldNotFoundException>()));
  });

  test("don't serialize static methods", () {
    var cws = ClassWithStatics();

    expect(() => cws['val'], throwsA(TypeMatcher<FieldNotFoundException>()));
    expect(() => cws['someMethod'](), throwsA(TypeMatcher<FieldNotFoundException>()));
  });
}
