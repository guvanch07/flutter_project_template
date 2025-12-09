// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/domain/repositories/secure_storage_repository.dart';

class SecureStorageRepositoryImpl implements SecureStorageRepository {
  final FlutterSecureStorage _secureStorage;

  const SecureStorageRepositoryImpl({
    required FlutterSecureStorage secureStorage,
  }) : _secureStorage = secureStorage;

  @override
  Future<bool> contains(DataSourceKey key, {bool synced = false}) async =>
      _secureStorage.containsKey(
        key: key.name,
        iOptions: _getIOSOptions(synced),
      );

  @override
  Future<T?> read<T>(DataSourceKey<T> key, {bool synced = false}) async =>
      switch (T) {
        int =>
          (int.tryParse(
                    (await _secureStorage.read(
                          key: key.name,
                          iOptions: _getIOSOptions(synced),
                        )) ??
                        '',
                  ) ??
                  key.defaultValue)
              as T?,
        String =>
          (await _secureStorage.read(
                    key: key.name,
                    iOptions: _getIOSOptions(synced),
                  )
                  as T?) ??
              key.defaultValue,
        double =>
          (double.tryParse(
                    (await _secureStorage.read(
                          key: key.name,
                          iOptions: _getIOSOptions(synced),
                        )) ??
                        '',
                  ) ??
                  key.defaultValue)
              as T?,
        bool =>
          (bool.tryParse(
                    (await _secureStorage.read(
                          key: key.name,
                          iOptions: _getIOSOptions(synced),
                        )) ??
                        '',
                  ) ??
                  key.defaultValue)
              as T?,
        _ =>
          key.read != null
              ? key.read!(
                      await _secureStorage.read(
                            key: key.name,
                            iOptions: _getIOSOptions(synced),
                          ) ??
                          '',
                    ) ??
                    key.defaultValue
              : throw UnimplementedError(
                  'Unimplemented type: $T. Add read method in DataSourceKey',
                ),
      };

  @override
  Future<void> write<T>(
    DataSourceKey<T> key,
    T? value, {
    bool synced = false,
  }) async {
    if (value == null) {
      await _secureStorage.delete(
        key: key.name,
        iOptions: _getIOSOptions(synced),
      );
      return;
    }
    return switch (T) {
      int || double || bool => _secureStorage.write(
        key: key.name,
        value: value.toString(),
        iOptions: _getIOSOptions(synced),
      ),
      String => _secureStorage.write(
        key: key.name,
        value: value as String,
        iOptions: _getIOSOptions(synced),
      ),
      _ =>
        key.write != null
            ? _secureStorage.write(
                key: key.name,
                value: key.write!(value),
                iOptions: _getIOSOptions(synced),
              )
            : throw UnimplementedError(
                'Unimplemented type: $T. Add write method in DataSourceKey',
              ),
    };
  }

  IOSOptions? _getIOSOptions(bool synced) =>
      synced ? const IOSOptions(synchronizable: true) : null;
}
