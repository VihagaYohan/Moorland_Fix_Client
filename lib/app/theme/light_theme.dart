import 'package:flutter/material.dart';
import 'app_colors.dart';

// custom themes
import 'package:moorland_fix/app/theme/custom_themes/index.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.lightBackground,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    background: AppColors.lightBackground,
    surface: AppColors.lightSurface
  ),
  textTheme: TTextTheme.lightTextTheme,
  textButtonTheme: TTextButtonTheme.lightTextButtonTheme,
);