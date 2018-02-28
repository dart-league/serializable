library just_generics_test;

import 'package:serializable/serializable.dart';
import 'package:test/test.dart';

part 'generics_test.g.dart';

@serializable
class GenClass<T> extends _$GenClassSerializable<T> {
  T data;

  List<T> list;

  Map<String, T> mapT;
}

void main() {
  group('generics: ', (){
    test('can create', (){
      var cool = new GenClass<String>();
      cool['data'] = 'hello, world!';
      cool['list'] = ['hello', 'world'];
      cool['mapT'] = {'hello': 'world'};
      expect(cool['data'],(x) => x is String);
      expect(cool['list'], (_) => _ is List);
      expect(cool['list'], (_) => _ is List<String>);
      expect(cool['mapT'], (_) => _ is Map);
      expect(cool['mapT'], (_) => _ is Map<String, String>);
    });
  });
}