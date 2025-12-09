// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

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
