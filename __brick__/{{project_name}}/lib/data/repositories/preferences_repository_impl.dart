import 'package:shared_preferences/shared_preferences.dart';
import 'package:{{project_name}}/domain/entities/data_source_key_entity.dart';
import 'package:{{project_name}}/domain/repositories/preferences_repository.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final SharedPreferencesAsync _sharedPreferences;

  const PreferencesRepositoryImpl({
    required SharedPreferencesAsync sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<bool> contains(DataSourceKey key) async =>
      _sharedPreferences.containsKey(key.name);

  @override
  Future<T?> read<T>(DataSourceKey<T> key) async => switch (T) {
    int =>
      (await _sharedPreferences.getInt(key.name) as T?) ?? key.defaultValue,
    String =>
      (await _sharedPreferences.getString(key.name) as T?) ?? key.defaultValue,
    double =>
      (await _sharedPreferences.getDouble(key.name) as T?) ?? key.defaultValue,
    bool =>
      (await _sharedPreferences.getBool(key.name) as T?) ?? key.defaultValue,
    StringList =>
      (await _sharedPreferences.getStringList(key.name) as T?) ??
          key.defaultValue,
    _ =>
      key.read != null
          ? key.read!(await _sharedPreferences.getString(key.name) ?? '') ??
                key.defaultValue
          : throw UnimplementedError(
              'Unimplemented type: $T. Add read method in DataSourceKey',
            ),
  };

  @override
  Future<void> write<T>(DataSourceKey<T> key, T? value) async {
    if (value == null) {
      await _sharedPreferences.remove(key.name);
      return;
    }
    return switch (T) {
      int => _sharedPreferences.setInt(key.name, value as int),
      String => _sharedPreferences.setString(key.name, value as String),
      double => _sharedPreferences.setDouble(key.name, value as double),
      bool => _sharedPreferences.setBool(key.name, value as bool),
      StringList => _sharedPreferences.setStringList(
        key.name,
        value as List<String>,
      ),
      _ =>
        key.write != null
            ? _sharedPreferences.setString(key.name, key.write!(value))
            : throw UnimplementedError(
                'Unimplemented type: $T. Add write method in DataSourceKey',
              ),
    };
  }
}

typedef StringList = List<String>;
