// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:flutter/material.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';

abstract class CustomThemeData {
  final CustomPalette palette;
  final CustomTextTheme textTheme;

  final Color primaryLight;
  final Color primaryDark;
  final Color onSurfaceLight;
  final Color onSurfaceDark;
  final Color onSurfaceVariantLight;
  final Color onSurfaceVariantDark;
  final Color errorLight;
  final Color errorDark;

  CustomThemeData({
    required this.palette,
    required this.textTheme,
    required this.primaryLight,
    required this.primaryDark,
    required this.onSurfaceLight,
    required this.onSurfaceDark,
    required this.onSurfaceVariantLight,
    required this.onSurfaceVariantDark,
    required this.errorLight,
    required this.errorDark,
  });

  ThemeData light(BuildContext context);

  ThemeData dark(BuildContext context);
}
