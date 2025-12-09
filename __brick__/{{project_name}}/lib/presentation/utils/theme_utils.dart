// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:flutter/material.dart';
import 'package:{{project_name}}/generated/translations.g.dart';

extension ThemeEx on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

extension ThemeModeExtension on ThemeMode {
  String localName(BuildContext context) =>
      context.t.general.theme.name[name] ?? context.t.general.unknownLabel;
}
