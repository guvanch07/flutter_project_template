import 'package:flutter/material.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/injection.dart' as di;

class CustomFontWeight {
  /// 400
  final FontWeight regular;

  /// 500
  final FontWeight medium;

  /// 600
  final FontWeight semiBold;

  /// 700
  final FontWeight bold;

  const CustomFontWeight({
    required this.regular,
    required this.medium,
    required this.semiBold,
    required this.bold,
  });

  factory CustomFontWeight.baseline() => const CustomFontWeight(
    regular: FontWeight.w400,
    medium: FontWeight.w500,
    semiBold: FontWeight.w600,
    bold: FontWeight.w700,
  );

  factory CustomFontWeight.mode() => const CustomFontWeight(
    regular: FontWeight.w400,
    medium: FontWeight.w500,
    semiBold: FontWeight.w600,
    bold: FontWeight.w700,
  );
}

extension CustomFontWeightExtension on BuildContext {
  CustomFontWeight get fontWeight =>
      di.locator<CommonUiData>().theme.textTheme.fontWeight;
}

extension FontWeightExtension on TextStyle? {
  static final CustomFontWeight _fontWeight = di
      .locator<CommonUiData>()
      .theme
      .textTheme
      .fontWeight;

  /// 400
  TextStyle? get weightRegular =>
      this?.copyWith(fontWeight: _fontWeight.regular);

  /// 500
  TextStyle? get weightMedium => this?.copyWith(fontWeight: _fontWeight.medium);

  /// 600
  TextStyle? get weightSemiBold =>
      this?.copyWith(fontWeight: _fontWeight.semiBold);

  /// 700
  TextStyle? get weightBold => this?.copyWith(fontWeight: _fontWeight.bold);
}
