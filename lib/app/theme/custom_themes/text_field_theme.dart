import 'package:flutter/material.dart';

// theme
import 'package:moorland_fix/app/theme/index.dart';

// shared
import 'package:moorland_fix/app/shared/index.dart';

class TTextFieldTheme  {
  TTextFieldTheme._();

  static InputDecorationTheme lightTextFieldTheme = InputDecorationTheme(
    errorMaxLines:2,
    errorStyle: const TextStyle().copyWith(
      color: AppColors.error
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Constants.spaceSmall),
      borderSide: BorderSide(
        width: 1,
        color: Colors.grey
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Constants.spaceSmall),
      borderSide: BorderSide(
        width: 1,
        color: AppColors.primary
      )
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(Constants.spaceSmall),
      borderSide: BorderSide(
        width: 1,
        color: AppColors.error
      )
    )
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
      errorMaxLines:2,
      errorStyle: const TextStyle().copyWith(
          color: AppColors.error
      ),
      border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(Constants.spaceSmall),
        borderSide: BorderSide(
            width: 1,
            color: Colors.grey
        ),
      ),
      focusedBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(Constants.spaceSmall),
          borderSide: BorderSide(
              width: 1,
              color: AppColors.primary
          )
      ),
      errorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(Constants.spaceSmall),
          borderSide: BorderSide(
              width: 1,
              color: AppColors.error
          )
      )
  );
}