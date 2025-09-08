import 'package:flutter/material.dart';
import 'app_colors.dart';

// custom themes
import 'package:moorland_fix/app/theme/custom_themes/index.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryVariant1,
  scaffoldBackgroundColor: AppColors.darkBackground,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primaryVariant1,
    secondary: AppColors.secondary,
    surfaceContainer: AppColors.darkBackground,
    surface: AppColors.darkSurface,
  ),
  textTheme: TTextTheme.darkTextTheme,
  textButtonTheme: TTextButtonTheme.darkTextButtonTheme
);
