import 'package:flutter/material.dart';

class FolkloriaColors {
  // Primary colors
  static const Color primary = Color(0xff596420);
  static const Color onPrimary = Color(0xffffffff);
  static const Color primaryContainer = Color(0xffddea97);
  static const Color onPrimaryContainer = Color(0xff414b08);

  // Secondary colors
  static const Color secondary = Color(0xff5d6145);
  static const Color onSecondary = Color(0xffffffff);
  static const Color secondaryContainer = Color(0xffe2e5c2);
  static const Color onSecondaryContainer = Color(0xff45492f);

  // Tertiary colors
  static const Color tertiary = Color(0xff3b665c);
  static const Color onTertiary = Color(0xffffffff);
  static const Color tertiaryContainer = Color(0xffbdecdf);
  static const Color onTertiaryContainer = Color(0xff224e45);

  // Error colors
  static const Color error = Color(0xffba1a1a);
  static const Color onError = Color(0xffffffff);
  static const Color errorContainer = Color(0xffffdad6);
  static const Color onErrorContainer = Color(0xff93000a);

  // Surface colors - Light theme
  static const Color surface = Color(0xfffbfaed);
  static const Color onSurface = Color(0xff1b1c15);
  static const Color onSurfaceVariant = Color(0xff46483b);
  static const Color outline = Color(0xff77786a);
  static const Color outlineVariant = Color(0xffc7c7b7);
  static const Color shadow = Color(0xff000000);
  static const Color scrim = Color(0xff000000);
  static const Color inverseSurface = Color(0xff303129);
  static const Color inversePrimary = Color(0xffc0ce7d);

  // Surface containers - Light theme
  static const Color surfaceDim = Color(0xffdcdace);
  static const Color surfaceBright = Color(0xfffbfaed);
  static const Color surfaceContainerLowest = Color(0xffffffff);
  static const Color surfaceContainerLow = Color(0xfff6f4e7);
  static const Color surfaceContainer = Color(0xfff0eee2);
  static const Color surfaceContainerHigh = Color(0xffeae9dc);
  static const Color surfaceContainerHighest = Color(0xffe4e3d6);

  // Dark theme surface colors
  static const Color surfaceDark = Color(0xff13140d);
  static const Color onSurfaceDark = Color(0xffe4e3d6);
  static const Color onSurfaceVariantDark = Color(0xffc7c7b7);
  static const Color outlineDark = Color(0xff90917f);
  static const Color outlineVariantDark = Color(0xff46483b);
  static const Color inverseSurfaceDark = Color(0xffe4e3d6);
  static const Color inversePrimaryDark = Color(0xff596420);

  // Dark theme primary colors
  static const Color primaryDark = Color(0xffc0ce7d);
  static const Color onPrimaryDark = Color(0xff2c3400);
  static const Color primaryContainerDark = Color(0xff414b08);
  static const Color onPrimaryContainerDark = Color(0xffddea97);

  // Dark theme secondary colors
  static const Color secondaryDark = Color(0xffc6c9a8);
  static const Color onSecondaryDark = Color(0xff2f321b);
  static const Color secondaryContainerDark = Color(0xff45492f);
  static const Color onSecondaryContainerDark = Color(0xffe2e5c2);

  // Dark theme tertiary colors
  static const Color tertiaryDark = Color(0xffa2d0c3);
  static const Color onTertiaryDark = Color(0xff05372e);
  static const Color tertiaryContainerDark = Color(0xff224e45);
  static const Color onTertiaryContainerDark = Color(0xffbdecdf);

  // Dark theme error colors
  static const Color errorDark = Color(0xffffb4ab);
  static const Color onErrorDark = Color(0xff690005);
  static const Color errorContainerDark = Color(0xff93000a);
  static const Color onErrorContainerDark = Color(0xffffdad6);

  // Light theme ColorScheme
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    surfaceTint: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    surface: surface,
    onSurface: onSurface,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    outlineVariant: outlineVariant,
    shadow: shadow,
    scrim: scrim,
    inverseSurface: inverseSurface,
    inversePrimary: inversePrimary,
  );

  // Dark theme ColorScheme
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primaryDark,
    surfaceTint: primaryDark,
    onPrimary: onPrimaryDark,
    primaryContainer: primaryContainerDark,
    onPrimaryContainer: onPrimaryContainerDark,
    secondary: secondaryDark,
    onSecondary: onSecondaryDark,
    secondaryContainer: secondaryContainerDark,
    onSecondaryContainer: onSecondaryContainerDark,
    tertiary: tertiaryDark,
    onTertiary: onTertiaryDark,
    tertiaryContainer: tertiaryContainerDark,
    onTertiaryContainer: onTertiaryContainerDark,
    error: errorDark,
    onError: onErrorDark,
    errorContainer: errorContainerDark,
    onErrorContainer: onErrorContainerDark,
    surface: surfaceDark,
    onSurface: onSurfaceDark,
    onSurfaceVariant: onSurfaceVariantDark,
    outline: outlineDark,
    outlineVariant: outlineVariantDark,
    shadow: shadow,
    scrim: scrim,
    inverseSurface: inverseSurfaceDark,
    inversePrimary: inversePrimaryDark,
  );
}
