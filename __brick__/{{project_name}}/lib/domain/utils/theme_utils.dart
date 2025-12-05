import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

extension ThemeModeExtension on ThemeMode {
  static ThemeMode fromName(String? name) =>
      fromNameNullable(name) ?? ThemeMode.system;

  static ThemeMode? fromNameNullable(String? name) =>
      ThemeMode.values.firstOrNullWhere((e) => e.name == name);
}
