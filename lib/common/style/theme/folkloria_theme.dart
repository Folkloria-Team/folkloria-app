import 'package:flutter/material.dart';
import 'package:folkloria/common/style/colors/folkloria_colors.dart';
import 'package:folkloria/common/style/typography/folkloria_text_styles.dart';

class FolkloriaTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: FolkloriaColors.green.color,
      brightness: Brightness.light,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: FolkloriaColors.green.color,
      brightness: Brightness.dark,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: FolkloriaTextStyles.displayLarge,
      displayMedium: FolkloriaTextStyles.displayMedium,
      displaySmall: FolkloriaTextStyles.displaySmall,
      headlineLarge: FolkloriaTextStyles.headlineLarge,
      headlineMedium: FolkloriaTextStyles.headlineMedium,
      headlineSmall: FolkloriaTextStyles.headlineSmall,
      titleLarge: FolkloriaTextStyles.titleLarge,
      titleMedium: FolkloriaTextStyles.titleMedium,
      titleSmall: FolkloriaTextStyles.titleSmall,
      bodyLarge: FolkloriaTextStyles.bodyLargeBold,
      bodyMedium: FolkloriaTextStyles.bodyLargeMedium,
      bodySmall: FolkloriaTextStyles.bodyLargeRegular,
      labelLarge: FolkloriaTextStyles.labelLarge,
      labelMedium: FolkloriaTextStyles.labelMedium,
      labelSmall: FolkloriaTextStyles.labelSmall,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      toolbarTextStyle: _textTheme.titleLarge,
      // shape: const BeveledRectangleBorder(
      //   // borderRadius: BorderRadius.only(
      //   //   bottomLeft: Radius.circular(14),
      //   //   bottomRight: Radius.circular(14),
      //   ),
      // ),
    );
  }
}
