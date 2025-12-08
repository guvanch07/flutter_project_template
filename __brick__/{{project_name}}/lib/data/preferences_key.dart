import 'package:flutter/material.dart';
import 'package:{{project_name}}/domain/entities/data_source_key_entity.dart';

class PreferencesKey {
  static const themeMode = DataSourceKey<ThemeMode>(
    'theme_mode',
    defaultValue: ThemeMode.system,
    write: _themeModeToString,
    read: _stringToThemeMode,
  );

  static const firebaseAuthHash = DataSourceKey<String>('firebase_auth_hash');

  static String _themeModeToString(ThemeMode mode) => mode.name;

  static ThemeMode _stringToThemeMode(String value) => ThemeMode.values
      .firstWhere((e) => e.name == value, orElse: () => ThemeMode.system);
}
