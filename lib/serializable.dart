/// Shorthand annotation of [Serializable] used to determine which classes will
/// be processed by the generator
const serializable = const Serializable();

/// annotation used to determine which files will be processed by the generator
class Serializable {
  const Serializable();
}

/// Interface that should be implemented by all the generated serializable classes
abstract class ISerializable implements Map {

  /// Add all the values the the [map] into the object.
  @override
  void addAll(Map map) {
    keys.forEach((key) => this[key] = map[key]);
  }

  /// Add all the values the the [map] into the current object. Is the same as [addAll]
  fromMap(Map map) => addAll(map);

  /// Create a [Map] from the values of the object.
  Map toMap() => new Map.from(this);

  /// Sets all the attributes values to null.
  @override
  void clear() {
    this.forEach((key, value) => this[key] = null);
  }

  /// Checks if the object has any attribute with the name of [key]
  @override
  bool containsKey(String key) => keys.contains(key);

  /// Check if any of the attributes contains the [value].
  @override
  bool containsValue(String value) => values.contains(value);

  /// runs function [f] for each [attribute]-[value] pair
  @override
  void forEach(void f(attribute, value)) {
    keys.forEach((attribute) {
      f(attribute, this[attribute]);
    });
  }

  /// does nothing
  @override
  putIfAbsent(key, ifAbsent()) {
  }

  /// Sets the [attribute] value to null
  @override
  remove(Object attribute) {
    this[attribute] = null;
  }

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
}
