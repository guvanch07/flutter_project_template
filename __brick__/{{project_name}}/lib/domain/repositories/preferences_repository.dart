// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:{{project_name}}/domain/entities/data_source_key_entity.dart';

abstract interface class PreferencesRepository {
  Future<T?> read<T>(DataSourceKey<T> key);

  Future<bool> contains(DataSourceKey key);

  Future<void> write<T>(DataSourceKey<T> key, T? value);
}
