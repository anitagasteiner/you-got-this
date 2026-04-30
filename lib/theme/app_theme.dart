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
    checkboxTheme: CheckboxThemeData(
      shape: CircleBorder(),
      side: BorderSide(
        width: 1.5,
        color: BaseColors.dark, 
      ),
      // side: WidgetStateBorderSide.resolveWith((states) {
      //   return BorderSide(
      //     width: 1,
      //     color: states.contains(WidgetState.selected)
      //       ? BaseColors.grey
      //       : BaseColors.dark,
      //   );
      // }),
      // visualDensity: VisualDensity.comfortable,
      // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );
}
