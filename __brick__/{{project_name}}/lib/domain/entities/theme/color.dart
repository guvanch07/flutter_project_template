import 'package:flutter/material.dart';

class CustomColor {
  /// Creates a color swatch with a variety of shades.
  const CustomColor(this._swatch);

  // TODO: review and maybe replace with primaryColor
  // and extends from ColorSwatch like MaterialColor
  static const _defaultColor = Colors.white;

  final Map<int, Color> _swatch;

  /// The lightest shade.
  Color get $100 => this[100];

  Color get $99 => this[99];

  Color get $98 => this[98];

  Color get $95 => this[95];

  Color get $90 => this[90];

  Color get $80 => this[80];

  Color get $70 => this[70];

  Color get $60 => this[60];

  Color get $50 => this[50];

  Color get $40 => this[40];

  Color get $35 => this[35];

  Color get $30 => this[30];

  Color get $25 => this[25];

  Color get $20 => this[20];

  Color get $15 => this[15];

  Color get $10 => this[10];

  Color get $5 => this[5];

  /// The darkest shade.
  Color get $0 => this[0];

  /// Returns an element of the swatch table.
  Color operator [](int index) => _swatch[index] ?? _defaultColor;
}

class CustomColorScheme extends ColorScheme {
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;

  CustomColorScheme({
    required ColorScheme colorScheme,
    required CustomColors customColors,
  }) : success = customColors.success,
       onSuccess = customColors.onSuccess,
       successContainer = customColors.successContainer,
       onSuccessContainer = customColors.onSuccessContainer,
       super(
         brightness: colorScheme.brightness,
         primary: colorScheme.primary,
         onPrimary: colorScheme.onPrimary,
         primaryContainer: colorScheme.primaryContainer,
         onPrimaryContainer: colorScheme.onPrimaryContainer,
         primaryFixed: colorScheme.primaryFixed,
         primaryFixedDim: colorScheme.primaryFixedDim,
         onPrimaryFixed: colorScheme.onPrimaryFixed,
         onPrimaryFixedVariant: colorScheme.onPrimaryFixedVariant,
         secondary: colorScheme.secondary,
         onSecondary: colorScheme.onSecondary,
         secondaryContainer: colorScheme.secondaryContainer,
         onSecondaryContainer: colorScheme.onSecondaryContainer,
         secondaryFixed: colorScheme.secondaryFixed,
         secondaryFixedDim: colorScheme.secondaryFixedDim,
         onSecondaryFixed: colorScheme.onSecondaryFixed,
         onSecondaryFixedVariant: colorScheme.onSecondaryFixedVariant,
         tertiary: colorScheme.tertiary,
         onTertiary: colorScheme.onTertiary,
         tertiaryContainer: colorScheme.tertiaryContainer,
         onTertiaryContainer: colorScheme.onTertiaryContainer,
         tertiaryFixed: colorScheme.tertiaryFixed,
         tertiaryFixedDim: colorScheme.tertiaryFixedDim,
         onTertiaryFixed: colorScheme.onTertiaryFixed,
         onTertiaryFixedVariant: colorScheme.onTertiaryFixedVariant,
         error: colorScheme.error,
         onError: colorScheme.onError,
         errorContainer: colorScheme.errorContainer,
         onErrorContainer: colorScheme.onErrorContainer,
         surface: colorScheme.surface,
         onSurface: colorScheme.onSurface,
         surfaceDim: colorScheme.surfaceDim,
         surfaceBright: colorScheme.surfaceBright,
         surfaceContainerLowest: colorScheme.surfaceContainerLowest,
         surfaceContainerLow: colorScheme.surfaceContainerLow,
         surfaceContainer: colorScheme.surfaceContainer,
         surfaceContainerHigh: colorScheme.surfaceContainerHigh,
         surfaceContainerHighest: colorScheme.surfaceContainerHighest,
         onSurfaceVariant: colorScheme.onSurfaceVariant,
         outline: colorScheme.outline,
         outlineVariant: colorScheme.outlineVariant,
         shadow: colorScheme.shadow,
         scrim: colorScheme.scrim,
         inverseSurface: colorScheme.inverseSurface,
         onInverseSurface: colorScheme.onInverseSurface,
         inversePrimary: colorScheme.inversePrimary,
       );
}

class CustomColors extends ThemeExtension<CustomColors> {
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;

  const CustomColors({
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
  });

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? outlineVariantTint,
    Color? surface1,
    Color? surface2,
    Color? surface3,
    Color? surface4,
  }) => CustomColors(
    success: success ?? this.success,
    onSuccess: onSuccess ?? this.onSuccess,
    successContainer: successContainer ?? this.successContainer,
    onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
  );

  @override
  ThemeExtension<CustomColors> lerp(
    covariant ThemeExtension<CustomColors>? other,
    double t,
  ) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      success: Color.lerp(success, other.success, t) ?? success,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t) ?? onSuccess,
      successContainer:
          Color.lerp(successContainer, other.successContainer, t) ??
          successContainer,
      onSuccessContainer:
          Color.lerp(onSuccessContainer, other.onSuccessContainer, t) ??
          onSuccessContainer,
    );
  }
}

extension ColorSchemeExtension on BuildContext {
  CustomColorScheme get colors => CustomColorScheme(
    colorScheme: Theme.of(this).colorScheme,
    customColors: Theme.of(this).extension<CustomColors>()!,
  );
}
