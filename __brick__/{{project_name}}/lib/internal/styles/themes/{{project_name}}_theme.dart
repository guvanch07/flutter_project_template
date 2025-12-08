// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/internal/styles/colors/{{project_name}}_palette.dart';

// TODO: review all inputDecorationTheme
class {{project_name|pascalCase}}Theme extends CustomThemeData {
  {{project_name|pascalCase}}Theme({required super.palette, required super.textTheme})
    : super(
        primaryLight: palette.primary.$40,
        primaryDark: palette.primary.$50,
        onSurfaceLight: palette.neutral.$10,
        onSurfaceDark: palette.neutral.$95,
        onSurfaceVariantLight: palette.neutralVariant.$30,
        onSurfaceVariantDark: palette.neutralVariant.$90,
        errorLight: palette.error.$40,
        errorDark: palette.error.$50,
      );

  factory {{project_name|pascalCase}}Theme.defaultPalette({required CustomTextTheme textTheme}) =>
      {{project_name|pascalCase}}Theme(palette: const {{project_name|pascalCase}}Palette(), textTheme: textTheme);

  Color get surfaceContainerLight => palette.neutralVariant.$95;
  Color get surfaceContainerLowLight => palette.neutralVariant.$98;
  Color get surfaceContainerDark => const Color(0xff17191C);
  Color get surfaceContainerLowDark => const Color(0xff17191C);

  @override
  ThemeData light(BuildContext context) => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: surfaceContainerLight,
    appBarTheme: Theme.of(context).appBarTheme.copyWith(
      surfaceTintColor: Colors.transparent,
      backgroundColor: surfaceContainerLight,
      titleTextStyle: textTheme.titleMedium?.copyWith(color: onSurfaceLight),
    ),
    colorScheme: ColorScheme.light(
      primary: primaryLight,
      onPrimary: Colors.white,
      primaryContainer: palette.primary.$90,
      onPrimaryContainer: palette.neutralVariant.$10,
      primaryFixed: palette.primary.$90,
      primaryFixedDim: palette.primary.$80,
      onPrimaryFixed: palette.primary.$10,
      onPrimaryFixedVariant: palette.primary.$30,
      secondary: palette.secondary.$40,
      onSecondary: palette.secondary.$100,
      secondaryContainer: palette.secondary.$90,
      onSecondaryContainer: palette.secondary.$10,
      secondaryFixed: palette.neutralVariant.$90,
      secondaryFixedDim: palette.neutralVariant.$80,
      onSecondaryFixed: palette.secondary.$10,
      onSecondaryFixedVariant: palette.secondary.$30,
      tertiary: palette.tertiary.$40,
      onTertiary: palette.error.$100,
      tertiaryContainer: palette.tertiary.$90,
      onTertiaryContainer: palette.tertiary.$10,
      tertiaryFixed: palette.tertiary.$90,
      tertiaryFixedDim: palette.tertiary.$80,
      onTertiaryFixed: palette.tertiary.$10,
      onTertiaryFixedVariant: palette.tertiary.$30,
      error: errorLight,
      onError: palette.error.$100,
      errorContainer: palette.error.$90,
      onErrorContainer: palette.error.$10,
      surface: palette.neutral.$98,
      onSurface: onSurfaceLight,
      surfaceDim: const Color(0xffD9D9E0),
      surfaceBright: palette.neutral.$98,
      surfaceContainerLowest: palette.neutral.$100,
      surfaceContainerLow: surfaceContainerLowLight,
      surfaceContainer: surfaceContainerLight,
      surfaceContainerHigh: palette.neutralVariant.$90,
      surfaceContainerHighest: palette.neutral.$90,
      onSurfaceVariant: onSurfaceVariantLight,
      outline: palette.neutralVariant.$50,
      outlineVariant: palette.neutralVariant.$80,
      shadow: palette.neutral.$0,
      scrim: palette.neutral.$0,
      inverseSurface: palette.neutral.$20,
      onInverseSurface: palette.neutral.$95,
      inversePrimary: palette.primary.$80,
      // surfaceTint: DefaultPalette,
    ),
    extensions: [
      CustomColors(
        success: palette.success.$40,
        onSuccess: palette.success.$100,
        successContainer: palette.success.$90,
        onSuccessContainer: palette.success.$10,
      ),
    ],
    fontFamily: textTheme.typeface.plain,
    inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
      labelStyle: WidgetStateTextStyle.resolveWith(
        (states) => states.contains(WidgetState.disabled)
            ? TextStyle(
                fontFamily: textTheme.typeface.plain,
                color: onSurfaceVariantLight.opacityDisable,
              )
            : TextStyle(
                fontFamily: textTheme.typeface.plain,
                color: onSurfaceVariantLight.opacitySecondary,
              ),
      ),
      hintStyle: WidgetStateTextStyle.resolveWith(
        (states) => states.contains(WidgetState.disabled)
            ? textTheme.bodyLarge!.copyWith(
                fontFamily: textTheme.typeface.plain,
                color: onSurfaceVariantLight.opacityDisable,
              )
            : textTheme.bodyLarge!.copyWith(
                fontFamily: textTheme.typeface.plain,
                color: onSurfaceVariantLight.opacitySecondary,
              ),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryLight, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return TextStyle(
            fontFamily: textTheme.typeface.plain,
            color: errorLight,
          );
        }
        if (states.contains(WidgetState.focused)) {
          return TextStyle(
            fontFamily: textTheme.typeface.plain,
            color: primaryLight,
          );
        }
        return TextStyle(
          fontFamily: textTheme.typeface.plain,
          color: onSurfaceVariantLight.opacitySecondary,
        );
      }),
      helperStyle: TextStyle(
        fontFamily: textTheme.typeface.plain,
      ).copyWith(color: onSurfaceVariantLight.opacitySecondary),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: errorLight, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: errorLight),
        borderRadius: BorderRadius.circular(8),
      ),
      isDense: false,
    ),
    textTheme: textTheme.apply(
      displayColor: onSurfaceLight,
      bodyColor: onSurfaceVariantLight,
    ),
    // visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  @override
  ThemeData dark(BuildContext context) => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: surfaceContainerDark,
    appBarTheme: Theme.of(context).appBarTheme.copyWith(
      surfaceTintColor: Colors.transparent,
      backgroundColor: surfaceContainerDark,
      titleTextStyle: textTheme.titleMedium?.copyWith(color: onSurfaceDark),
    ),
    colorScheme: ColorScheme.dark(
      primary: primaryDark,
      onPrimary: palette.primary.$100,
      primaryContainer: palette.neutralVariant.$15,
      onPrimaryContainer: palette.neutralVariant.$90,
      primaryFixed: palette.primary.$15,
      primaryFixedDim: palette.primary.$20,
      onPrimaryFixed: const Color(0xff21005D),
      onPrimaryFixedVariant: const Color(0xff4F378B),
      secondary: palette.secondary.$50,
      onSecondary: palette.secondary.$100,
      secondaryContainer: palette.secondary.$15,
      onSecondaryContainer: palette.secondary.$90,
      secondaryFixed: const Color(0xffE8DEF8),
      secondaryFixedDim: const Color(0xffCCC2DC),
      onSecondaryFixed: const Color(0xff1D192B),
      onSecondaryFixedVariant: const Color(0xff4A4458),
      tertiary: palette.tertiary.$50,
      onTertiary: palette.tertiary.$100,
      tertiaryContainer: palette.tertiary.$15,
      onTertiaryContainer: palette.tertiary.$90,
      tertiaryFixed: const Color(0xffFFD8E4),
      tertiaryFixedDim: palette.tertiary.$20,
      onTertiaryFixed: const Color(0xff31111D),
      onTertiaryFixedVariant: const Color(0xff633B48),
      error: errorDark,
      onError: palette.error.$100,
      errorContainer: palette.error.$10,
      onErrorContainer: palette.error.$90,
      // surface: const Color(0xff141218),
      surface: const Color(0xff27272B),
      onSurface: onSurfaceDark,
      surfaceDim: const Color(0xff111318),
      surfaceBright: const Color(0xff37393E),
      // surfaceContainerLowest: const Color(0xff0C0E13),
      // surfaceContainerLow: surfaceContainerLowDark,
      surfaceContainerLowest: const Color(0xff21242B),
      surfaceContainerLow: surfaceContainerLowDark,
      surfaceContainer: surfaceContainerDark,
      surfaceContainerHigh: const Color(0xff282A2F),
      surfaceContainerHighest: const Color(0xff33353A),
      onSurfaceVariant: onSurfaceVariantDark,
      outline: palette.neutralVariant.$60,
      outlineVariant: palette.neutralVariant.$30,
      shadow: palette.neutral.$0,
      scrim: palette.neutral.$0,
      inverseSurface: palette.neutral.$90,
      onInverseSurface: palette.neutral.$20,
      inversePrimary: palette.primary.$40,
      // surfaceTint: DefaultPalette,
    ),
    extensions: [
      CustomColors(
        success: palette.success.$50,
        onSuccess: palette.success.$100,
        successContainer: palette.success.$15,
        onSuccessContainer: palette.success.$90,
      ),
    ],
    fontFamily: textTheme.typeface.plain,
    inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
      labelStyle: WidgetStateTextStyle.resolveWith(
        (states) => states.contains(WidgetState.disabled)
            ? TextStyle(
                fontFamily: textTheme.typeface.plain,
                color: onSurfaceVariantDark.opacityDisable,
              )
            : TextStyle(
                fontFamily: textTheme.typeface.plain,
                color: onSurfaceVariantDark.opacitySecondary,
              ),
      ),
      hintStyle: WidgetStateTextStyle.resolveWith(
        (states) => states.contains(WidgetState.disabled)
            ? textTheme.bodyLarge!.copyWith(
                fontFamily: textTheme.typeface.plain,
                color: onSurfaceVariantDark.opacityDisable,
              )
            : textTheme.bodyLarge!.copyWith(
                fontFamily: textTheme.typeface.plain,
                color: onSurfaceVariantDark.opacitySecondary,
              ),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryDark, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return TextStyle(
            fontFamily: textTheme.typeface.plain,
            color: errorDark,
          );
        }
        if (states.contains(WidgetState.focused)) {
          return TextStyle(
            fontFamily: textTheme.typeface.plain,
            color: primaryDark,
          );
        }
        return TextStyle(
          fontFamily: textTheme.typeface.plain,
          color: onSurfaceVariantDark.opacitySecondary,
        );
      }),
      helperStyle: TextStyle(
        fontFamily: textTheme.typeface.plain,
      ).copyWith(color: onSurfaceVariantDark.opacitySecondary),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: errorDark, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: errorDark),
        borderRadius: BorderRadius.circular(8),
      ),
      isDense: false,
    ),
    textTheme: textTheme.apply(
      displayColor: onSurfaceDark,
      bodyColor: onSurfaceVariantDark,
    ),
    // visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
