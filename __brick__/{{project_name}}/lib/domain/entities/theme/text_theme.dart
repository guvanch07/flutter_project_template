// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:flutter/material.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';

class CustomTextTheme extends TextTheme {
  final CustomTypeface typeface;
  final CustomFontWeight fontWeight;

  const CustomTextTheme({required this.typeface, required this.fontWeight});
}
