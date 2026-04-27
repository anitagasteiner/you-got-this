import 'package:flutter/material.dart';
import 'package:you_got_this/common/colors.dart';

class AppTheme {
  static ThemeData main = ThemeData(
    fontFamily: 'Montserrat',
    scaffoldBackgroundColor: BaseColors.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: BaseColors.main,
      secondary: BaseColors.accent,
    ),
    textTheme: TextTheme(
          bodyLarge: TextStyle(color: BaseColors.dark),
          bodyMedium: TextStyle(color: BaseColors.dark),
          titleLarge: TextStyle(color: BaseColors.dark),
        ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: BaseColors.dark,
        fontSize: 14,
      ),
    ),
  );
}
