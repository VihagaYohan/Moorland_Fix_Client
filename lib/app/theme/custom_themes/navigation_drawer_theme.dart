import 'package:flutter/material.dart';

// theme
import 'package:moorland_fix/app/theme/index.dart';

// utils
import 'package:moorland_fix/app/shared/index.dart';

class TNavigationDrawer {
  TNavigationDrawer._();

  static var lightNavigationDrawer = NavigationDrawerThemeData(
    backgroundColor: AppColors.lightSurface,
    elevation: 5,
    indicatorColor: AppColors.primary.withValues(alpha: 0.5),
    surfaceTintColor: AppColors.primary,
    labelTextStyle: WidgetStateProperty.fromMap(<WidgetStatesConstraint, TextStyle>{
     WidgetState.selected: TextStyle(
       color: AppColors.primary,
       fontSize: 16,
       fontFamily: Constants.fontFamilyPoppins
     ),
      WidgetState.any: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontFamily: Constants.fontFamilyPoppins
      )
    })
  );

  static var darkNavigationDrawer = NavigationDrawerThemeData(
    backgroundColor: AppColors.darkBackground,
    elevation: 5,
    indicatorColor: AppColors.primary.withValues(alpha: 0.3),
    surfaceTintColor: AppColors.primary,
    labelTextStyle: WidgetStateProperty.fromMap(<WidgetStatesConstraint, TextStyle>{
      WidgetState.selected: TextStyle(
        color: AppColors.darkPrimary,
        fontSize: 16,
        fontFamily: Constants.fontFamilyPoppins
      )
    }),
  );
}