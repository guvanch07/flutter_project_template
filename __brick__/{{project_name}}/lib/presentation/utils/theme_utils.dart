import 'package:flutter/material.dart';
import 'package:{{project_name}}/generated/translations.g.dart';

extension ThemeEx on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

extension ThemeModeExtension on ThemeMode {
  String localName(BuildContext context) =>
      context.t.general.theme.name[name] ?? context.t.general.unknownLabel;
}
