library deserialiazer.deserialize_enums_test;

import 'dart:convert';

import 'package:serializable/serializable.dart';
import 'package:test/test.dart';

part 'deserialize_enums_test.g.dart';

enum Color {
  BLUE,
  RED,
  GREEN
}

@serializable
class ObjectWithEnum extends _$ObjectWithEnumSerializable {
  Color color;
}

main() {
  test('deserialize object with enum', () {
    expect((ObjectWithEnum()..fromMap(jsonDecode('{"color":0}'))).color, Color.BLUE);
    expect((ObjectWithEnum()..fromMap(jsonDecode('{"color":1}'))).color, Color.RED);
    expect((ObjectWithEnum()..fromMap(jsonDecode('{"color":2}'))).color, Color.GREEN);
  });
}