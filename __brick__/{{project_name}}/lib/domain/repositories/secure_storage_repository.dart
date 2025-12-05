import 'package:{{project_name}}/domain/entities/entities.dart';

abstract interface class SecureStorageRepository {
  Future<T?> read<T>(DataSourceKey<T> key, {bool synced = false});

  Future<bool> contains(DataSourceKey key, {bool synced = false});

  Future<void> write<T>(DataSourceKey<T> key, T? value, {bool synced = false});
}
