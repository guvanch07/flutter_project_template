class DataSourceKey<T> {
  final String name;
  final T? defaultValue;
  final String Function(T value)? write;
  final T Function(String value)? read;

  const DataSourceKey(this.name, {this.defaultValue, this.write, this.read});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DataSourceKey &&
          runtimeType == other.runtimeType &&
          name == other.name);

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => 'DataSourceKey{name: $name}';
}
