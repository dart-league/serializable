/// Shorthand annotation of [Serializable] used to determine which files will be processed by the generator
const serializable = const Serializable();

/// annotation used to determine which files will be processed by the generator
class Serializable {
  const Serializable();
}

/// Interface that should be implemented by all the generated serializable classes
abstract class ISerializable implements Map {

  @override
  void addAll(Map other) {
    other.forEach((key, value) => this[key] = value);
  }

  @override
  void clear() {
    this.forEach((key, value) => this[key] = null);
  }

  @override
  bool containsKey(Object key) => keys.contains(key);

  @override
  bool containsValue(Object value) => values.contains(value);

  @override
  void forEach(void f(key, value)) {
    keys.forEach((key) {
      f(key, this[key]);
    });
  }

  @override
  putIfAbsent(key, ifAbsent()) {
  }

  @override
  remove(Object key) {
    remove(key);
  }

  @override
  bool get isEmpty => keys.isEmpty;

  @override
  bool get isNotEmpty => !isEmpty;

  @override
  int get length => values.length;

  Iterable get values => keys.map((key) => this[key]);
}
