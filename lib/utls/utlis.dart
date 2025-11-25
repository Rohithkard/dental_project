extension SafeListExtension<T> on List<T>? {
  /// Returns first item safely, null if list is null or empty
  T? get cFirst {
    final list = this;
    if (list == null || list.isEmpty) return null;
    return list.first;
  }

  /// Returns last item safely, null if list is null or empty
  T? get cLast {
    final list = this;
    if (list == null || list.isEmpty) return null;
    return list.last;
  }

  /// Safe index fetch: returns null if index out of range
  T? cAt(int index) {
    final list = this;
    if (list == null || list.length <= index || index < 0) return null;
    return list[index];
  }
}
