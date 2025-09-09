import 'package:flutter/material.dart';

// theme
import 'package:moorland_fix/app/theme/index.dart';

class TDividerTheme {
  TDividerTheme._();

  static var lightDividerTheme = DividerThemeData(
      color: AppColors.primaryVariant1,
  );

  static var darkDividerTheme = DividerThemeData(
    color: AppColors.darkPrimaryVariant1
  );
}