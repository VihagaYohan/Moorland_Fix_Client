import 'package:flutter/material.dart';

// theme
import 'package:moorland_fix/app/theme/index.dart';

class TDatePickerTheme {
  TDatePickerTheme._();

  static DatePickerThemeData lightDatePickerTheme =  DatePickerThemeData(
    backgroundColor: AppColors.lightBackground,
    dividerColor: AppColors.primary,
    weekdayStyle: TextStyle(
      color: AppColors.darkTextPrimary
    ),
    confirmButtonStyle: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.primary),
      foregroundColor: WidgetStateProperty.all(AppColors.lightBackground),
    )
  );

  static DatePickerThemeData darkDatePickerTheme = DatePickerThemeData(
    backgroundColor: AppColors.darkBackground,
    dividerColor: AppColors.primary,
    weekdayStyle: TextStyle(color: AppColors.lightTextPrimary),
    dayStyle: TextStyle(
      color: Colors.grey
    ),
    confirmButtonStyle: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.primary),
      foregroundColor: WidgetStateProperty.all(Colors.white)
    )
  );
}