// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';

class {{project_name|pascalCase}}TextTheme extends void CustomTextTheme {
  const {{project_name|pascalCase}}TextTheme({required super.typeface, required super.fontWeight});

  @override
  TextStyle get displayLarge => TextStyle(
    fontFamily: typeface.brand,
    fontWeight: fontWeight.regular,
    fontSize: 57,
    height: 64 / 57,
    letterSpacing: -0.25,
  );

  @override
  TextStyle get displayMedium => TextStyle(
    fontFamily: typeface.brand,
    fontWeight: fontWeight.regular,
    fontSize: 45,
    height: 52 / 45,
    letterSpacing: 0,
  );

  @override
  TextStyle get displaySmall => TextStyle(
    fontFamily: typeface.brand,
    fontWeight: fontWeight.regular,
    fontSize: 36,
    height: 44 / 36,
    letterSpacing: 0,
  );

  TextStyle get headlineXLarge => TextStyle(
    fontFamily: typeface.brand,
    fontWeight: fontWeight.bold,
    fontSize: 48,
    height: 52 / 48,
    letterSpacing: -1.5,
  );

  @override
  TextStyle get headlineLarge => TextStyle(
    fontFamily: typeface.brand,
    fontWeight: fontWeight.bold,
    fontSize: 32,
    height: 40 / 32,
    letterSpacing: -1,
  );

  @override
  TextStyle get headlineMedium => TextStyle(
    fontFamily: typeface.brand,
    fontWeight: fontWeight.bold,
    fontSize: 28,
    height: 36 / 28,
    letterSpacing: -0.75,
  );

  @override
  TextStyle get headlineSmall => TextStyle(
    fontFamily: typeface.brand,
    fontWeight: fontWeight.bold,
    fontSize: 24,
    height: 32 / 24,
    letterSpacing: -0.5,
  );

  @override
  TextStyle get titleLarge => TextStyle(
    fontFamily: typeface.brand,
    fontWeight: fontWeight.semiBold,
    fontSize: 22,
    height: 28 / 22,
    letterSpacing: -0.5,
  );

  @override
  TextStyle get titleMedium => TextStyle(
    fontFamily: typeface.brand,
    fontWeight: fontWeight.bold,
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: -0.2,
  );

  @override
  TextStyle get titleSmall => TextStyle(
    fontFamily: typeface.brand,
    fontWeight: fontWeight.semiBold,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
  );

  @override
  TextStyle get labelLarge => TextStyle(
    fontFamily: typeface.brand,
    fontWeight: fontWeight.semiBold,
    fontSize: 16,
    height: 20 / 16,
    letterSpacing: -0.1,
  );

  @override
  TextStyle get labelMedium => TextStyle(
    fontFamily: typeface.brand,
    fontWeight: fontWeight.semiBold,
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.5,
  );

  @override
  TextStyle get labelSmall => TextStyle(
    fontFamily: typeface.brand,
    fontWeight: fontWeight.medium,
    fontSize: 11,
    height: 16 / 11,
    letterSpacing: 0.5,
  );

  @override
  TextStyle get bodyLarge => TextStyle(
    fontFamily: typeface.plain,
    fontWeight: fontWeight.regular,
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: -0.5,
  );

  @override
  TextStyle get bodyMedium => TextStyle(
    fontFamily: typeface.plain,
    fontWeight: fontWeight.regular,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: -0.25,
  );

  @override
  TextStyle get bodySmall => TextStyle(
    fontFamily: typeface.plain,
    fontWeight: fontWeight.regular,
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.4,
  );
}
