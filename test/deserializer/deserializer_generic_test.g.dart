// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deserializer_generic_test.dart';

// **************************************************************************
// SerializableGenerator
// **************************************************************************

mixin _$SimpleClassSerializable on SerializableMap {
  String? get name;
  set name(String? v);
  String toString();

  operator [](Object? __key) {
    switch (__key) {
      case 'name':
        return name;
      case 'toString':
        return toString;
    }
    throwFieldNotFoundException(__key, 'SimpleClass');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {
      case 'name':
        name = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'SimpleClass');
  }

  Iterable<String> get keys => const ['name'];
}

mixin _$ListStringSerializable on SerializableMap {
  List<String>? get list;
  set list(List<String>? v);

  operator [](Object? __key) {
    switch (__key) {
      case 'list':
        return list;
    }
    throwFieldNotFoundException(__key, 'ListString');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {
      case 'list':
        list =
            fromSerialized(__value, () => List<String>.empty(growable: true));
        return;
    }
    throwFieldNotFoundException(__key, 'ListString');
  }

  Iterable<String> get keys => const ['list'];
}

mixin _$ListClassSerializable on SerializableMap {
  List<SimpleClass>? get list;
  set list(List<SimpleClass>? v);

  operator [](Object? __key) {
    switch (__key) {
      case 'list':
        return list;
    }
    throwFieldNotFoundException(__key, 'ListClass');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {
      case 'list':
        list = fromSerialized(__value, [
          () => List<SimpleClass>.empty(growable: true),
          () => SimpleClass()
        ]);
        return;
    }
    throwFieldNotFoundException(__key, 'ListClass');
  }

  Iterable<String> get keys => const ['list'];
}

mixin _$ListTClassSerializable<T> on SerializableMap {
  List<T>? get listT;
  set listT(List<T>? v);

  operator [](Object? __key) {
    switch (__key) {
      case 'listT':
        return listT;
    }
    throwFieldNotFoundException(__key, 'ListTClass');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {
      case 'listT':
        listT = fromSerialized(__value, () => List<T>.empty(growable: true));
        return;
    }
    throwFieldNotFoundException(__key, 'ListTClass');
  }

  Iterable<String> get keys => const ['listT'];
}

mixin _$ListListClassSerializable on SerializableMap {
  List<List<SimpleClass>>? get list;
  set list(List<List<SimpleClass>>? v);

  operator [](Object? __key) {
    switch (__key) {
      case 'list':
        return list;
    }
    throwFieldNotFoundException(__key, 'ListListClass');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {
      case 'list':
        list = fromSerialized(__value, [
          () => List<List<SimpleClass>>.empty(growable: true),
          [() => List<SimpleClass>.empty(growable: true), () => SimpleClass()]
        ]);
        return;
    }
    throwFieldNotFoundException(__key, 'ListListClass');
  }

  Iterable<String> get keys => const ['list'];
}

mixin _$ListListListClassSerializable on SerializableMap {
  List<List<List<SimpleClass>>>? get list;
  set list(List<List<List<SimpleClass>>>? v);

  operator [](Object? __key) {
    switch (__key) {
      case 'list':
        return list;
    }
    throwFieldNotFoundException(__key, 'ListListListClass');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {
      case 'list':
        list = fromSerialized(__value, [
          () => List<List<List<SimpleClass>>>.empty(growable: true),
          [
            () => List<List<SimpleClass>>.empty(growable: true),
            [() => List<SimpleClass>.empty(growable: true), () => SimpleClass()]
          ]
        ]);
        return;
    }
    throwFieldNotFoundException(__key, 'ListListListClass');
  }

  Iterable<String> get keys => const ['list'];
}

mixin _$ListMapClassSerializable on SerializableMap {
  List<Map<String, SimpleClass>>? get list;
  set list(List<Map<String, SimpleClass>>? v);

  operator [](Object? __key) {
    switch (__key) {
      case 'list':
        return list;
    }
    throwFieldNotFoundException(__key, 'ListMapClass');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {
      case 'list':
        list = fromSerialized(__value, [
          () => List<Map<String, SimpleClass>>.empty(growable: true),
          [() => Map<String, SimpleClass>(), null, () => SimpleClass()]
        ]);
        return;
    }
    throwFieldNotFoundException(__key, 'ListMapClass');
  }

  Iterable<String> get keys => const ['list'];
}

mixin _$ListListMapClassSerializable on SerializableMap {
  List<List<Map<String, SimpleClass>>>? get list;
  set list(List<List<Map<String, SimpleClass>>>? v);

  operator [](Object? __key) {
    switch (__key) {
      case 'list':
        return list;
    }
    throwFieldNotFoundException(__key, 'ListListMapClass');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {
      case 'list':
        list = fromSerialized(__value, [
          () => List<List<Map<String, SimpleClass>>>.empty(growable: true),
          [
            () => List<Map<String, SimpleClass>>.empty(growable: true),
            [() => Map<String, SimpleClass>(), null, () => SimpleClass()]
          ]
        ]);
        return;
    }
    throwFieldNotFoundException(__key, 'ListListMapClass');
  }

  Iterable<String> get keys => const ['list'];
}

mixin _$MapStringStringClassSerializable on SerializableMap {
  Map<String, String>? get myMap;
  set myMap(Map<String, String>? v);

  operator [](Object? __key) {
    switch (__key) {
      case 'myMap':
        return myMap;
    }
    throwFieldNotFoundException(__key, 'MapStringStringClass');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {
      case 'myMap':
        myMap = fromSerialized(__value, () => Map<String, String>());
        return;
    }
    throwFieldNotFoundException(__key, 'MapStringStringClass');
  }

  Iterable<String> get keys => const ['myMap'];
}

mixin _$MapClassSerializable on SerializableMap {
  Map<String, SimpleClass>? get myMap;
  set myMap(Map<String, SimpleClass>? v);

  operator [](Object? __key) {
    switch (__key) {
      case 'myMap':
        return myMap;
    }
    throwFieldNotFoundException(__key, 'MapClass');
  }

  operator []=(Object? __key, __value) {
    switch (__key) {
      case 'myMap':
        myMap = fromSerialized(__value,
            [() => Map<String, SimpleClass>(), null, () => SimpleClass()]);
        return;
    }
    throwFieldNotFoundException(__key, 'MapClass');
  }

  Iterable<String> get keys => const ['myMap'];
}
