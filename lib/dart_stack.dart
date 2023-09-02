/// @class DartStack<E>
///
/// A dart equivalent of stack
///
/// Named "DartStack" because flutter already
/// has a widget named "Stack".
class DartStack<E> {
  List _entries = [];

  void push(E entry) => _entries.add(entry);

  E pop() => isNotEmpty ? _entries.removeLast() : null;

  E peek() => _entries.last;

  E getEntryAt(int index) => _entries[index];

  bool get isEmpty => _entries.isEmpty;
  bool get isNotEmpty => _entries.isNotEmpty;
  int get length => _entries.length;

  @override
  String toString() => _entries.toString();
}
