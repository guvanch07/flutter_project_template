// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/injection.dart' as di;
import 'package:{{project_name}}/internal/styles/text_theme/{{project_name}}_text_theme.dart';
import 'package:{{project_name}}/internal/styles/themes/{{project_name}}_theme.dart';

class CommonUiDataWrapper extends StatefulWidget {
  final CommonUiData? defaultData;
  final Widget child;

  const CommonUiDataWrapper({super.key, this.defaultData, required this.child});

  @override
  State<CommonUiDataWrapper> createState() => _CommonUiDataWrapperState();
}

class _CommonUiDataWrapperState extends State<CommonUiDataWrapper> {
  CommonUiData get defaultData =>
      widget.defaultData ??
      CommonUiData(
        theme: PokemonTheme.defaultPalette(
          textTheme: PokemonTextTheme(
            typeface: const CustomTypeface(
              brand: 'SF Pro Display',
              plain: 'SF Compact Text',
            ),
            fontWeight: CustomFontWeight.baseline(),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    initUiData(context);
    return widget.child;
  }

  void initUiData(BuildContext context) {
    if (!di.locator.isRegistered<CommonUiData>()) {
      di.initUiData(data: defaultData);
      return;
    }
    if (di.locator.isRegistered<CommonUiData>() &&
        widget.defaultData != di.locator<CommonUiData>()) {
      di.locator.unregister<CommonUiData>();
      di.initUiData(data: defaultData);
    }
  }
}
