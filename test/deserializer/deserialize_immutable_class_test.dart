library deserialiazer.deserialize_immutable_class_test;

import 'package:serializable/serializable.dart';
import 'package:test/test.dart';
import 'dart:convert';

part 'deserialize_immutable_class_test.g.dart';

@serializable
class ImmutableClass extends _$ImmutableClassSerializable {
  final String name;

  @SerializedName("the_renamed")
  final String renamed;

  ImmutableClass(this.name, this.renamed);
}

@serializable
class ImmutableWithOptionalParameters extends _$ImmutableWithOptionalParametersSerializable {
  final int id;
  final String name;

  ImmutableWithOptionalParameters({this.id, this.name});
}

@serializable
class ImmutableClassInvalidParameter extends _$ImmutableClassInvalidParameterSerializable {
  final String name;

  const ImmutableClassInvalidParameter(String aName) : name = aName;
}

@serializable
class ListWithImmutableClass extends _$ListWithImmutableClassSerializable {
  ImmutableClass immutable;
  List<ImmutableClass> immutables;
}

main() {
  test('deserialize: immutable class.', () {
    var map = jsonDecode('{"name":"test", "the_renamed": "test"}');
    ImmutableClass test = new ImmutableClass(map['name'], map['the_renamed']);
    expect(test.name, equals("test"));
    expect(test.renamed, equals("test"));
  });

  test('deserialize: immutable class with optional parameters.', () {
    var map = jsonDecode('{"id": 1, "name": "test"}');
    ImmutableWithOptionalParameters test = new ImmutableWithOptionalParameters(id: map['id'], name: map['name']);
    expect(test.id, equals(1));
    expect(test.name, equals("test"));
  });

  test('deserialize: immutable class with invalid parameter', () {
      var map = jsonDecode('{"name":"failure"}');
      var test = new ImmutableClassInvalidParameter(map['aName']);
      expect(test['name'], null);
  });
}
