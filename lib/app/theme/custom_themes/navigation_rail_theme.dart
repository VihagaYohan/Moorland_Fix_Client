import 'package:flutter/material.dart';
// theme
import 'package:moorland_fix/app/theme/index.dart';

class TNavigationRail {
  TNavigationRail._();

  static var lightNavigationRail = NavigationRailThemeData(
    backgroundColor: AppColors.lightBackground,
    selectedLabelTextStyle: TextStyle(color: AppColors.primary),
    unselectedLabelTextStyle: TextStyle(color: Colors.grey),
    selectedIconTheme: IconThemeData(color: AppColors.primary),
    unselectedIconTheme: IconThemeData(color: Colors.grey),
    groupAlignment: 0.0,
  );

  static var darkNavigationRail = NavigationRailThemeData(
    backgroundColor: AppColors.darkSurface,
    selectedLabelTextStyle: TextStyle(color: AppColors.primary),
    unselectedLabelTextStyle: TextStyle(color: Colors.grey),
    selectedIconTheme: IconThemeData(color: AppColors.primary),
    unselectedIconTheme: IconThemeData(color: Colors.grey),
    groupAlignment: 0.0,
  );
}
