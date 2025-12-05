import 'package:flutter/material.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/injection.dart' as di;

class CustomTypeface {
  /// used for headers
  final String brand;

  /// used for body and others
  final String plain;

  const CustomTypeface({required this.brand, required this.plain});

  factory CustomTypeface.baseline() =>
      const CustomTypeface(brand: 'SF Pro Display', plain: 'SF Compact Text');

  factory CustomTypeface.mode() =>
      const CustomTypeface(brand: 'Manrope', plain: 'Manrope');
}

extension CustomTypefaceExtension on BuildContext {
  CustomTypeface get typeface =>
      di.locator<CommonUiData>().theme.textTheme.typeface;
}
