import 'package:flutter/material.dart';

// utils
import 'package:moorland_fix/app/theme/app_colors.dart';

class TTextButtonTheme {
  TTextButtonTheme._();

  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppColors.lightSurface
    )
  );

  static TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppColors.darkSurface
    )
  );
}