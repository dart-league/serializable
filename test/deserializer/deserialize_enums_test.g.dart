// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deserialize_enums_test.dart';

// **************************************************************************
// SerializableGenerator
// **************************************************************************

mixin _$ObjectWithEnumSerializable on SerializableMap {
  Color? get color;
  set color(Color? v);

  operator [](Object? __key) {
    switch (__key) {
      case 'color':
        return color;
    }
    throwFieldNotFoundException(__key, 'ObjectWithEnum');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {
      case 'color':
        color = fromSerializedEnum(__value, Color, () => Color.values);
        return;
    }
    throwFieldNotFoundException(__key, 'ObjectWithEnum');
  }

  Iterable<String> get keys => const ['color'];
}
