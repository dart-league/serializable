import 'dart:core';

import 'package:built_mirrors/built_mirrors.dart';

export 'package:built_mirrors/built_mirrors.dart';

/// Shorthand annotation of [Serializable] used to determine which classes will
/// be processed by the generator
const Serializable serializable = Serializable();

/// annotation used to determine which files will be processed by the generator
class Serializable extends Reflectable {
  const Serializable();
}

/// Interface that should be implemented by all the generated serializable classes
abstract class SerializableMap implements Map {
  const SerializableMap();

  /// Returns the field names of the Object
  @override
  Iterable get keys => null;

  // TODO: implement entries
  @override
  Iterable<MapEntry> get entries => null;

  /// check if the object [keys] is empty
  @override
  bool get isEmpty => keys.isEmpty;

  /// check if the object [keys] is empty
  @override
  bool get isNotEmpty => !isEmpty;

  /// return the length of [keys]
  @override
  int get length => keys.length;

  /// return the attributes values
  Iterable get values => keys.map((key) => this[key]);

  /// Add all the values the the [map] into the object.
  @override
  void addAll(Map map) {
    keys.forEach((key) => this[key] = map[key]);
  }

  /// Add all the values the the [map] into the current object. Is the same as [addAll]
  void fromMap(Map map) => addAll(map);

  /// Create a [Map] from the values of the object.
  Map toMap() => Map.from(this);

  /// Sets all the attributes values to null.
  @override
  void clear() {
    this.forEach((key, value) => this[key] = null);
  }

  /// Checks if the object has any attribute with the name of [key]
  @override
  bool containsKey(Object key) => keys.contains(key);

  /// Check if any of the attributes contains the [value].
  @override
  bool containsValue(Object value) => values.contains(value);

  /// runs function [f] for each [attribute]-[value] pair
  @override
  void forEach(void f(attribute, value)) {
    keys.forEach((attribute) {
      f(attribute, this[attribute]);
    });
  }

  /// does nothing
  @override
  putIfAbsent(key, ifAbsent()) {}

  /// Sets the [attribute] value to null
  @override
  remove(Object attribute) {
    this[attribute] = null;
  }

  @override
  void addEntries(Iterable<MapEntry> newEntries) {
    // TODO: implement addEntries
  }

  @override
  Map<RK, RV> cast<RK, RV>() {
    return null;
  }

  @override
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(dynamic key, dynamic value) f) {
    return null;
  }

  @override
  void removeWhere(predicate) {
    // TODO: implement removeWhere
  }

  @override
  update(key, update, {dynamic Function() ifAbsent}) {
    // TODO: implement update
  }

  @override
  void updateAll(update) {
    // TODO: implement updateAll
  }
}

class FieldNotFoundException implements Exception {
  final String type;
  final String key;

  FieldNotFoundException([this.key, this.type]);

  toString() => "FieldNotFoundException: The key \"$key\" doesn't exist on class \"$type\"";
}

throwFieldNotFoundException(String key, String type) => throw FieldNotFoundException(key, type);

/// Converts the [serialized] value into its respective complex object value depending on the result of the factory
/// function.
///
/// example:
///
///     fromSerialized({'id': 1, 'name': 'Jhon'}, () => new Person());
///
///     fromSerialized([{'id': 1, 'name': 'Jhon'}], [() => new List<Person>(), () => new Person()]);
///
///     fromSerialized({'items': [{'id': 1, 'name': 'Jhon'}]},
///                    [() => new Map<String, List<Person>>(), [() => new List<Person>(), () => new Person()]);
fromSerialized(serialized, /*Function | List<Function | List<Function | ...>>*/ factory) {
  if (serialized == null) {
    return serialized;
  } else if (serialized is List) {
    return _fromSerializedIterable(serialized, factory);
  } else if (serialized is Set) {
    return _fromSerializedIterable(serialized, factory);
  } else if (serialized is Map) {
    return _fromSerializedMap(serialized, factory);
  }
}

Map _fromSerializedMap(Map serializedMap, /*Function | List<Function | List<Function | ...>>*/ factory) {
  Map result;
  if (factory is List) {
    result = factory[0]();
    serializedMap.forEach((key, value) {
      result[key] = fromSerialized(value, factory[2]);
    });
  } else {
    result = factory();
    serializedMap.forEach((k, v) {
      result[k] = v;
    });
  }
  return result;
}

/*<List | Set>*/ _fromSerializedIterable(/*<List | Set>*/ serialized, /*Function | List<Function | List<Function | ...>>*/ factory) {
  var result;
  if (factory is List) {
    result = factory[0]();
    serialized.forEach((v) {
      result.add(fromSerialized(v, factory[1]));
    });
  } else {
    result = factory();
    serialized.forEach((v) {
      result.add(v);
    });
  }
  return result;
}

/// Converts the [serialized] integer value into an enum in dependence of the factory result
///
/// Example:
///
///     enum Color {
///       red,
///       blue
///     }
///
///     ...
///
///     fromSerializedEnum(0, Color, () => Color.values);  // returns `Color.red`
///     fromSerializedEnum(1, Color, () => Color.values);  // returns `Color.blue`
///     fromSerializedEnum(null, Color, () => Color.values);  // returns `null`
///     fromSerializedEnum(Color.blue, Color, () => Color.values);  // returns `Color.blue`
fromSerializedEnum(int serialized, Type type, Function factory) {
  return serialized == null || serialized.runtimeType == type ? serialized : factory()[serialized];
}

/// Converts the [serialized] integer or ISO formatted String into a Datetime value
///
/// example:
///     fromSerializedDateTime(1533343671) // returns a DateTime object for `2018-08-04T00:47:51-0000`
///     fromSerializedDateTime('2002-02-27T14:00:00-0500') // returns DateTime Object form `2002-02-27T14:00:00-0500`
fromSerializedDateTime(serialized) {
  return serialized is num
      ? DateTime.fromMillisecondsSinceEpoch(serialized)
      : serialized is String
        ? DateTime.parse(serialized)
        : serialized;
}
