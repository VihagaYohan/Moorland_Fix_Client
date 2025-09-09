import 'package:flutter/material.dart';

// theme
import 'package:moorland_fix/app/theme/index.dart';

class TBottomNavigationTheme {
  TBottomNavigationTheme._();

  static var lightBottomNavigationTheme =  NavigationBarThemeData(
    surfaceTintColor: AppColors.lightSurface,
    backgroundColor: AppColors.lightBackground,
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(
        color: AppColors.primary
      )
    ),
  );

  static var darkBottomNavigationTheme =  NavigationBarThemeData(
    surfaceTintColor: AppColors.darkSurface,
    backgroundColor: AppColors.darkBackground,
    indicatorColor: AppColors.primary.withValues(alpha: 0.15),
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(
        color: AppColors.primary
      )
    )
  );
}