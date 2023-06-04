library deserialiazer.deserialize_generic_test;

import 'dart:convert';

import 'package:test/test.dart';
import 'package:serializable/serializable.dart';

part 'deserializer_generic_test.g.dart';

@serializable
class SimpleClass extends SerializableMap with _$SimpleClassSerializable {
  String? name;

  String toString() => "SimpleClass: name: ${name}";
}

@serializable
class ListString extends SerializableMap with _$ListStringSerializable{
  List<String>? list;
}

@serializable
class ListClass extends SerializableMap with _$ListClassSerializable {
  List<SimpleClass>? list;
}

@serializable
class ListTClass<T> extends SerializableMap with _$ListTClassSerializable<T> {
  List<T>? listT;
}

@serializable
class ListListClass extends SerializableMap with _$ListListClassSerializable {
  List<List<SimpleClass>>? list;
}

@serializable
class ListListListClass extends SerializableMap with _$ListListListClassSerializable {
  List<List<List<SimpleClass>>>? list;
}

@serializable
class ListMapClass extends SerializableMap with _$ListMapClassSerializable {
  List<Map<String, SimpleClass>>? list;
}

@serializable
class ListListMapClass extends SerializableMap with _$ListListMapClassSerializable {
  List<List<Map<String, SimpleClass>>>? list;
}

@serializable
class MapStringStringClass extends SerializableMap with _$MapStringStringClassSerializable {
  Map<String, String>? myMap;
}

@serializable
class MapClass extends SerializableMap with _$MapClassSerializable {
  Map<String, SimpleClass>? myMap;
}

main() {
  test('deserialize: generic List<String>', () {
    ListString test = ListString()..fromMap(jsonDecode('{"list": ["test1", "test2"]}'));

    expect(test.list?[0], 'test1');
    expect(test.list?[1], 'test2');
  });

  test('deserialize: generic List<SimpleClass>', () {
    ListClass test = ListClass()..fromMap(jsonDecode('{"list": [{"name": "test1"}, {"name": "test2"}]}'));

    expect(test.list?[0].name, 'test1');
    expect(test.list?[1].name, 'test2');
  });

  test('deserialize: generic List<List<SimpleClass>>', () {
    ListListClass test = ListListClass()..fromMap(jsonDecode('{"list": [[{"name": "test1"}, {"name": "test2"}]]}'));

    expect(test.list?[0][0].name, 'test1');
    expect(test.list?[0][1].name, 'test2');
  });

  test('deserialize: generic List<List<List<SimpleClass>>>', () {
    ListListListClass test = ListListListClass()
      ..fromMap(jsonDecode('{"list": [[[{"name": "test1"}, {"name": "test2"}]]]}'));

    expect(test.list?[0][0][0].name, 'test1');
    expect(test.list?[0][0][1].name, 'test2');
  });

  test('deserialize: generic List<Map<String, SimpleClass>>', () {
    ListMapClass test = ListMapClass()
      ..fromMap(jsonDecode('{"list": [{"simpleClass1": {"name": "test1"}, "simpleClass2": {"name": "test2"}}]}'));

    expect(test.list?[0]['simpleClass1']?.name, 'test1');
    expect(test.list?[0]['simpleClass2']?.name, 'test2');
  });

  test('deserialize: generic List<List<Map<String, SimpleClass>>>', () {
    ListListMapClass test = ListListMapClass()
      ..fromMap(jsonDecode(
        '{"list": [[{"simpleClass1": {"name": "test1"}, "simpleClass2": {"name": "test2"}}]]}'));

    expect(test.list?[0][0]['simpleClass1']?.name, 'test1');
    expect(test.list?[0][0]['simpleClass2']?.name, 'test2');
  });

  test('deserialize: generic map', () {
    MapStringStringClass test = MapStringStringClass()
      ..fromMap(jsonDecode('{"myMap": {"test": "test", "test2": "test2"}}'));

    expect(test.myMap?["test"], "test");
    expect(test.myMap?["test2"], "test2");
  });

  test('deserialize: generic map', () {
    MapClass test = MapClass()
      ..fromMap(jsonDecode('{"myMap": {"test": {"name": "test"}, "test2": {"name": "test2"}}}'));

    expect(test.myMap?["test"]?.name, "test");
    expect(test.myMap?["test2"]?.name, "test2");
  });
}
