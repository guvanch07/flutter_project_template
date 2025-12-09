import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';

part 'button_data.freezed.dart';

enum CustomOutlinedButtonType { outlined, text }

enum CustomElevatedButtonType { primary, tonal, destructive }

enum CustomButtonSize { large, medium, small }

enum SocialButtonType { apple, facebook, google }

const double _buttonExtraHeight = kIsWeb ? 8 : 0;

@freezed
class CustomButtonConfigWrapper with _$CustomButtonConfigWrapper {
  factory CustomButtonConfigWrapper({
    required CustomButtonConfig large,
    required CustomButtonConfig medium,
    required CustomButtonConfig small,
  }) = _CustomButtonConfigWrapper;

  factory CustomButtonConfigWrapper.defaultConfigs() =>
      CustomButtonConfigWrapper(
        large: CustomButtonConfig.defaultLarge(),
        medium: CustomButtonConfig.defaultMedium(),
        small: CustomButtonConfig.defaultSmall(),
      );
}

@freezed
class CustomButtonConfig with _$CustomButtonConfig {
  // TODO: move here: icon-label, text-iconR
  factory CustomButtonConfig({
    /// [height] in figma.
    required double height,

    /// [icon-size] in figma.
    required double iconSize,

    /// [radius] in figma.
    required double borderRadius,

    /// [text] in figma.
    required double fontSize,

    /// [LR] in figma. left right padding
    required double horizontalPadding,

    /// [iconL] in figma. left padding in icon button
    required double iconLeftPadding,
  }) = _CustomButtonConfig;

  factory CustomButtonConfig.defaultLarge() => CustomButtonConfig(
    height: CustomSpace().$12 + _buttonExtraHeight,
    iconSize: 20,
    borderRadius: CustomCorner.full,
    fontSize: 16,
    horizontalPadding: CustomSpace().$8,
    iconLeftPadding: CustomSpace().$5,
  );

  factory CustomButtonConfig.defaultMedium() => CustomButtonConfig(
    height: CustomSpace().$10 + _buttonExtraHeight,
    iconSize: 18,
    borderRadius: CustomCorner.full,
    fontSize: 14,
    horizontalPadding: CustomSpace().$6,
    iconLeftPadding: CustomSpace().$4,
  );

  factory CustomButtonConfig.defaultSmall() => CustomButtonConfig(
    height: CustomSpace().$8 + _buttonExtraHeight,
    iconSize: 16,
    borderRadius: CustomCorner.full,
    fontSize: 14,
    horizontalPadding: CustomSpace().$5,
    iconLeftPadding: CustomSpace()[2.5],
  );
}
