import 'package:flutter/material.dart';
// utils
import 'package:moorland_fix/app/theme/app_colors.dart';

class TTextButtonTheme {
  TTextButtonTheme._();

  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(AppColors.primary),
      overlayColor: WidgetStateProperty.all(
        AppColors.lightSurface.withValues(alpha: 0.2), // pressed/hover effect
      ),
      backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.pressed)) {
          return AppColors.lightSurface; // only when pressed
        }
        return null;
      }),
    ),
  );

  static TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(AppColors.darkPrimary),
      overlayColor: WidgetStateProperty.all(
        AppColors.darkSurface.withValues(alpha: 0.2),
      ),
      backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.pressed)) {
          return AppColors.darkSurface;
        }
        return null;
      }),
    ),
  );
}
