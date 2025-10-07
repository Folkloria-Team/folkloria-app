import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff596420),
      surfaceTint: Color(0xff596420),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffddea97),
      onPrimaryContainer: Color(0xff414b08),
      secondary: Color(0xff5d6145),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe2e5c2),
      onSecondaryContainer: Color(0xff45492f),
      tertiary: Color(0xff3b665c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbdecdf),
      onTertiaryContainer: Color(0xff224e45),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffbfaed),
      onSurface: Color(0xff1b1c15),
      onSurfaceVariant: Color(0xff46483b),
      outline: Color(0xff77786a),
      outlineVariant: Color(0xffc7c7b7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303129),
      inversePrimary: Color(0xffc0ce7d),
      primaryFixed: Color(0xffddea97),
      onPrimaryFixed: Color(0xff191e00),
      primaryFixedDim: Color(0xffc0ce7d),
      onPrimaryFixedVariant: Color(0xff414b08),
      secondaryFixed: Color(0xffe2e5c2),
      onSecondaryFixed: Color(0xff1a1d08),
      secondaryFixedDim: Color(0xffc6c9a8),
      onSecondaryFixedVariant: Color(0xff45492f),
      tertiaryFixed: Color(0xffbdecdf),
      onTertiaryFixed: Color(0xff00201a),
      tertiaryFixedDim: Color(0xffa2d0c3),
      onTertiaryFixedVariant: Color(0xff224e45),
      surfaceDim: Color(0xffdcdace),
      surfaceBright: Color(0xfffbfaed),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f4e7),
      surfaceContainer: Color(0xfff0eee2),
      surfaceContainerHigh: Color(0xffeae9dc),
      surfaceContainerHighest: Color(0xffe4e3d6),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff313a00),
      surfaceTint: Color(0xff596420),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff67732d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff343820),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6b7053),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff0d3d34),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff49756a),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbfaed),
      onSurface: Color(0xff11120b),
      onSurfaceVariant: Color(0xff36372b),
      outline: Color(0xff525347),
      outlineVariant: Color(0xff6d6e60),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303129),
      inversePrimary: Color(0xffc0ce7d),
      primaryFixed: Color(0xff67732d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff4f5a17),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6b7053),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff53573c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff49756a),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff315d52),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc8c7bb),
      surfaceBright: Color(0xfffbfaed),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f4e7),
      surfaceContainer: Color(0xffeae9dc),
      surfaceContainerHigh: Color(0xffdeddd1),
      surfaceContainerHighest: Color(0xffd3d2c6),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff282f00),
      surfaceTint: Color(0xff596420),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff444e0a),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2a2e17),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff474b31),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00332a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff245147),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbfaed),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2c2d22),
      outlineVariant: Color(0xff494a3e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303129),
      inversePrimary: Color(0xffc0ce7d),
      primaryFixed: Color(0xff444e0a),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff2e3600),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff474b31),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff31351d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff245147),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff083a31),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbab9ae),
      surfaceBright: Color(0xfffbfaed),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f1e4),
      surfaceContainer: Color(0xffe4e3d6),
      surfaceContainerHigh: Color(0xffd6d5c9),
      surfaceContainerHighest: Color(0xffc8c7bb),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc0ce7d),
      surfaceTint: Color(0xffc0ce7d),
      onPrimary: Color(0xff2c3400),
      primaryContainer: Color(0xff414b08),
      onPrimaryContainer: Color(0xffddea97),
      secondary: Color(0xffc6c9a8),
      onSecondary: Color(0xff2f321b),
      secondaryContainer: Color(0xff45492f),
      onSecondaryContainer: Color(0xffe2e5c2),
      tertiary: Color(0xffa2d0c3),
      onTertiary: Color(0xff05372e),
      tertiaryContainer: Color(0xff224e45),
      onTertiaryContainer: Color(0xffbdecdf),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff13140d),
      onSurface: Color(0xffe4e3d6),
      onSurfaceVariant: Color(0xffc7c7b7),
      outline: Color(0xff919283),
      outlineVariant: Color(0xff46483b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e3d6),
      inversePrimary: Color(0xff596420),
      primaryFixed: Color(0xffddea97),
      onPrimaryFixed: Color(0xff191e00),
      primaryFixedDim: Color(0xffc0ce7d),
      onPrimaryFixedVariant: Color(0xff414b08),
      secondaryFixed: Color(0xffe2e5c2),
      onSecondaryFixed: Color(0xff1a1d08),
      secondaryFixedDim: Color(0xffc6c9a8),
      onSecondaryFixedVariant: Color(0xff45492f),
      tertiaryFixed: Color(0xffbdecdf),
      onTertiaryFixed: Color(0xff00201a),
      tertiaryFixedDim: Color(0xffa2d0c3),
      onTertiaryFixedVariant: Color(0xff224e45),
      surfaceDim: Color(0xff13140d),
      surfaceBright: Color(0xff393a31),
      surfaceContainerLowest: Color(0xff0e0f08),
      surfaceContainerLow: Color(0xff1b1c15),
      surfaceContainer: Color(0xff1f2018),
      surfaceContainerHigh: Color(0xff2a2b22),
      surfaceContainerHighest: Color(0xff35352d),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd6e491),
      surfaceTint: Color(0xffc0ce7d),
      onPrimary: Color(0xff222900),
      primaryContainer: Color(0xff8b974d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffdcdfbc),
      onSecondary: Color(0xff242811),
      secondaryContainer: Color(0xff8f9374),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb7e6d9),
      onTertiary: Color(0xff002c24),
      tertiaryContainer: Color(0xff6d998e),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff13140d),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffddddcd),
      outline: Color(0xffb3b3a3),
      outlineVariant: Color(0xff919183),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e3d6),
      inversePrimary: Color(0xff424d09),
      primaryFixed: Color(0xffddea97),
      onPrimaryFixed: Color(0xff0f1300),
      primaryFixedDim: Color(0xffc0ce7d),
      onPrimaryFixedVariant: Color(0xff313a00),
      secondaryFixed: Color(0xffe2e5c2),
      onSecondaryFixed: Color(0xff0f1302),
      secondaryFixedDim: Color(0xffc6c9a8),
      onSecondaryFixedVariant: Color(0xff343820),
      tertiaryFixed: Color(0xffbdecdf),
      onTertiaryFixed: Color(0xff001510),
      tertiaryFixedDim: Color(0xffa2d0c3),
      onTertiaryFixedVariant: Color(0xff0d3d34),
      surfaceDim: Color(0xff13140d),
      surfaceBright: Color(0xff44453c),
      surfaceContainerLowest: Color(0xff070803),
      surfaceContainerLow: Color(0xff1d1e17),
      surfaceContainer: Color(0xff282820),
      surfaceContainerHigh: Color(0xff32332b),
      surfaceContainerHighest: Color(0xff3e3e35),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffeaf8a3),
      surfaceTint: Color(0xffc0ce7d),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffbdca7a),
      onPrimaryContainer: Color(0xff090d00),
      secondary: Color(0xffeff3cf),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc2c5a4),
      onSecondaryContainer: Color(0xff090d00),
      tertiary: Color(0xffcafaec),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff9eccbf),
      onTertiaryContainer: Color(0xff000e0a),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff13140d),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff1f1e0),
      outlineVariant: Color(0xffc3c4b3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e3d6),
      inversePrimary: Color(0xff424d09),
      primaryFixed: Color(0xffddea97),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffc0ce7d),
      onPrimaryFixedVariant: Color(0xff0f1300),
      secondaryFixed: Color(0xffe2e5c2),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc6c9a8),
      onSecondaryFixedVariant: Color(0xff0f1302),
      tertiaryFixed: Color(0xffbdecdf),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa2d0c3),
      onTertiaryFixedVariant: Color(0xff001510),
      surfaceDim: Color(0xff13140d),
      surfaceBright: Color(0xff505147),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1f2018),
      surfaceContainer: Color(0xff303129),
      surfaceContainerHigh: Color(0xff3b3c33),
      surfaceContainerHighest: Color(0xff47473e),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
