

import 'package:flutter/material.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';

class CustomTextTheme extends TextTheme {
  final CustomTypeface typeface;
  final CustomFontWeight fontWeight;

  const CustomTextTheme({required this.typeface, required this.fontWeight});
}
