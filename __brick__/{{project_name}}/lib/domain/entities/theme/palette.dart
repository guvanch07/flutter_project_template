// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:flutter/material.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/injection.dart' as di;

class CustomPalette {
  final CustomColor primary;
  final CustomColor secondary;
  final CustomColor tertiary;
  final CustomColor error;
  final CustomColor neutral;
  final CustomColor neutralVariant;
  final CustomColor success;

  CustomPalette({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.error,
    required this.neutral,
    required this.neutralVariant,
    required this.success,
  });
}

extension CustomPaletteExtension on BuildContext {
  CustomPalette get palette => di.locator<CommonUiData>().theme.palette;
}
