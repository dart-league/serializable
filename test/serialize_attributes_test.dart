library serialize_attributes_test;

import 'package:serializable/serializable.dart';
import 'package:test/test.dart';

part 'serialize_attributes_test.g.dart';

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
  int sum5(int val) => val + 5;
}

@serializable
class ClassWithOperator extends _$ClassWithOperatorSerializable {
  int val;

  int operator +(_val) => val + _val;
}

@serializable
class ClassWithStatics extends _$ClassWithStaticsSerializable {
  static int val = 5;

  static someMethod() {
    print('hello');
  }
}

main() {
  test('serialize attributes', () {
    var p1 = new Person()
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

    expect(() => p1['no_existing'], throwsA(new isInstanceOf<FieldNotFoundException>()));
  });

  test('serialize methods', () {
    var cwm = new ClassWithMethod();
    expect(cwm['sum5'](5), 10);
  });

  test("don't serialize operator methods", () {
    var cwo = new ClassWithOperator()
      ..val = 5;

    expect(() => cwo['operator+'], throwsA(new isInstanceOf<FieldNotFoundException>()));
  });

  test("don't serialize static methods", () {
    var cws = new ClassWithStatics();

    expect(() => cws['val'], throwsA(new isInstanceOf<FieldNotFoundException>()));
    expect(() => cws['someMethod'](), throwsA(new isInstanceOf<FieldNotFoundException>()));
  });
}