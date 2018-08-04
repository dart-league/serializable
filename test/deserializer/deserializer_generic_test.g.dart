// GENERATED CODE - DO NOT MODIFY BY HAND

part of deserialiazer.deserialize_generic_test;

// **************************************************************************
// SerializableGenerator
// **************************************************************************

abstract class _$SimpleClassSerializable extends SerializableMap {
  String get name;
  void set name(String v);
  String toString();

  operator [](Object __key) {
    switch (__key) {
      case 'name':
        return name;
      case 'toString':
        return toString;
    }
    throwFieldNotFoundException(__key, 'SimpleClass');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'name':
        name = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'SimpleClass');
  }

  Iterable<String> get keys => const ['name'];
}

abstract class _$ListStringSerializable extends SerializableMap {
  List<String> get list;
  void set list(List<String> v);

  operator [](Object __key) {
    switch (__key) {
      case 'list':
        return list;
    }
    throwFieldNotFoundException(__key, 'ListString');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'list':
        list = fromSerialized(__value, () => new List<String>());
        return;
    }
    throwFieldNotFoundException(__key, 'ListString');
  }

  Iterable<String> get keys => const ['list'];
}

abstract class _$ListClassSerializable extends SerializableMap {
  List<SimpleClass> get list;
  void set list(List<SimpleClass> v);

  operator [](Object __key) {
    switch (__key) {
      case 'list':
        return list;
    }
    throwFieldNotFoundException(__key, 'ListClass');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'list':
        list = fromSerialized(
            __value, [() => new List<SimpleClass>(), () => new SimpleClass()]);
        return;
    }
    throwFieldNotFoundException(__key, 'ListClass');
  }

  Iterable<String> get keys => const ['list'];
}

abstract class _$ListTClassSerializable<T> extends SerializableMap {
  List<T> get listT;
  void set listT(List<T> v);

  operator [](Object __key) {
    switch (__key) {
      case 'listT':
        return listT;
    }
    throwFieldNotFoundException(__key, 'ListTClass');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'listT':
        listT = fromSerialized(__value, () => new List<T>());
        return;
    }
    throwFieldNotFoundException(__key, 'ListTClass');
  }

  Iterable<String> get keys => const ['listT'];
}

abstract class _$ListListClassSerializable extends SerializableMap {
  List<List<SimpleClass>> get list;
  void set list(List<List<SimpleClass>> v);

  operator [](Object __key) {
    switch (__key) {
      case 'list':
        return list;
    }
    throwFieldNotFoundException(__key, 'ListListClass');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'list':
        list = fromSerialized(__value, [
          () => new List<List<SimpleClass>>(),
          [() => new List<SimpleClass>(), () => new SimpleClass()]
        ]);
        return;
    }
    throwFieldNotFoundException(__key, 'ListListClass');
  }

  Iterable<String> get keys => const ['list'];
}

abstract class _$ListListListClassSerializable extends SerializableMap {
  List<List<List<SimpleClass>>> get list;
  void set list(List<List<List<SimpleClass>>> v);

  operator [](Object __key) {
    switch (__key) {
      case 'list':
        return list;
    }
    throwFieldNotFoundException(__key, 'ListListListClass');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'list':
        list = fromSerialized(__value, [
          () => new List<List<List<SimpleClass>>>(),
          [
            () => new List<List<SimpleClass>>(),
            [() => new List<SimpleClass>(), () => new SimpleClass()]
          ]
        ]);
        return;
    }
    throwFieldNotFoundException(__key, 'ListListListClass');
  }

  Iterable<String> get keys => const ['list'];
}

abstract class _$ListMapClassSerializable extends SerializableMap {
  List<Map<String, SimpleClass>> get list;
  void set list(List<Map<String, SimpleClass>> v);

  operator [](Object __key) {
    switch (__key) {
      case 'list':
        return list;
    }
    throwFieldNotFoundException(__key, 'ListMapClass');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'list':
        list = fromSerialized(__value, [
          () => new List<Map<String, SimpleClass>>(),
          [() => new Map<String, SimpleClass>(), null, () => new SimpleClass()]
        ]);
        return;
    }
    throwFieldNotFoundException(__key, 'ListMapClass');
  }

  Iterable<String> get keys => const ['list'];
}

abstract class _$ListListMapClassSerializable extends SerializableMap {
  List<List<Map<String, SimpleClass>>> get list;
  void set list(List<List<Map<String, SimpleClass>>> v);

  operator [](Object __key) {
    switch (__key) {
      case 'list':
        return list;
    }
    throwFieldNotFoundException(__key, 'ListListMapClass');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'list':
        list = fromSerialized(__value, [
          () => new List<List<Map<String, SimpleClass>>>(),
          [
            () => new List<Map<String, SimpleClass>>(),
            [
              () => new Map<String, SimpleClass>(),
              null,
              () => new SimpleClass()
            ]
          ]
        ]);
        return;
    }
    throwFieldNotFoundException(__key, 'ListListMapClass');
  }

  Iterable<String> get keys => const ['list'];
}

abstract class _$MapStringStringClassSerializable extends SerializableMap {
  Map<String, String> get myMap;
  void set myMap(Map<String, String> v);

  operator [](Object __key) {
    switch (__key) {
      case 'myMap':
        return myMap;
    }
    throwFieldNotFoundException(__key, 'MapStringStringClass');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'myMap':
        myMap = fromSerialized(__value, () => new Map<String, String>());
        return;
    }
    throwFieldNotFoundException(__key, 'MapStringStringClass');
  }

  Iterable<String> get keys => const ['myMap'];
}

abstract class _$MapClassSerializable extends SerializableMap {
  Map<String, SimpleClass> get myMap;
  void set myMap(Map<String, SimpleClass> v);

  operator [](Object __key) {
    switch (__key) {
      case 'myMap':
        return myMap;
    }
    throwFieldNotFoundException(__key, 'MapClass');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'myMap':
        myMap = fromSerialized(__value, [
          () => new Map<String, SimpleClass>(),
          null,
          () => new SimpleClass()
        ]);
        return;
    }
    throwFieldNotFoundException(__key, 'MapClass');
  }

  Iterable<String> get keys => const ['myMap'];
}
