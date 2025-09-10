import 'package:flutter/material.dart';
// utils
import 'package:moorland_fix/app/shared/index.dart';
// theme
import 'package:moorland_fix/app/theme/index.dart';

class TNavigationDrawer {
  TNavigationDrawer._();

  static var lightNavigationDrawer = NavigationDrawerThemeData(
    surfaceTintColor: AppColors.lightSurface,
    backgroundColor: AppColors.lightBackground,
    elevation: 5,
    indicatorColor: AppColors.primary.withValues(alpha: 0.5),
    // surfaceTintColor: AppColors.primary,
    labelTextStyle:
        WidgetStateProperty.fromMap(<WidgetStatesConstraint, TextStyle>{
          WidgetState.selected: TextStyle(
            color: AppColors.primary,
            fontSize: 16,
            fontFamily: Constants.fontFamilyPoppins,
          ),
          WidgetState.any: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: Constants.fontFamilyPoppins,
          ),
        }),
  );

  static var darkNavigationDrawer = NavigationDrawerThemeData(
    surfaceTintColor: AppColors.darkSurface,
    backgroundColor: AppColors.darkBackground,
    elevation: 5,
    indicatorColor: AppColors.primary.withValues(alpha: 0.3),
    labelTextStyle:
        WidgetStateProperty.fromMap(<WidgetStatesConstraint, TextStyle>{
          WidgetState.selected: TextStyle(
            color: AppColors.darkPrimary,
            fontSize: 16,
            fontFamily: Constants.fontFamilyPoppins,
          ),
        }),
  );
}
