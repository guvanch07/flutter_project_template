// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:{{project_name}}/domain/entities/entities.dart';

abstract interface class SecureStorageRepository {
  Future<T?> read<T>(DataSourceKey<T> key, {bool synced = false});

  Future<bool> contains(DataSourceKey key, {bool synced = false});

  Future<void> write<T>(DataSourceKey<T> key, T? value, {bool synced = false});
}
