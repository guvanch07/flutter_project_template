import 'package:flutter/material.dart' show ThemeMode;
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/generated/translations.g.dart';

// ignore: avoid_classes_with_only_static_members
class PreferencesKey {
  static const themeMode = DataSourceKey<ThemeMode>(
    'theme_mode',
    defaultValue: ThemeMode.system,
    write: _themeModeToString,
    read: _stringToThemeMode,
  );

  static DataSourceKey<AppLocale> appLocale = DataSourceKey<AppLocale>(
    'appLocale',
    write: (value) => value.name,
    read: (value) => AppLocale.values.firstWhere(
      (locale) => locale.languageCode == value,
      orElse: () => AppLocale.en,
    ),
  );

  static const firebaseAuthHash = DataSourceKey<String>('firebase_auth_hash');

  static String _themeModeToString(ThemeMode mode) => mode.name;

  static ThemeMode _stringToThemeMode(String value) => ThemeMode.values
      .firstWhere((e) => e.name == value, orElse: () => ThemeMode.system);
}
