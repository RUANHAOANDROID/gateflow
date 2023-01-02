import 'dart:collection';

//需要定义一个LinkedListEntry子类
class LinkedListEntryImpl<T> extends LinkedListEntry<LinkedListEntryImpl<T>> {
  final T value;

  LinkedListEntryImpl(this.value);

  @override
  String toString() {
    return "value is $value";
  }
}
