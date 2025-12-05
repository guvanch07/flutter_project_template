import 'package:{{project_name}}/domain/entities/data_source_key_entity.dart';

abstract interface class PreferencesRepository {
  Future<T?> read<T>(DataSourceKey<T> key);

  Future<bool> contains(DataSourceKey key);

  Future<void> write<T>(DataSourceKey<T> key, T? value);
}
