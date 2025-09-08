import 'package:flutter/material.dart';

// utils
import 'package:moorland_fix/app/shared/constants.dart';

// colors
import 'package:moorland_fix/app/theme/app_colors.dart';

class TTextTheme {
  TTextTheme._();

  /*
  * display large
  * headline small
  * title large
  * title medium
  * body large
  * body medium
  * body small
  * label large
  * label medium
  * */

  static TextTheme lightTextTheme = TextTheme(
    // app title/branding
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      fontFamily: Constants.fontFamilyPoppins,
      color: AppColors.primary
    ),

    // section titles
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: Constants.fontFamilyPoppins,
      color: AppColors.primaryVariant1
    ),

    // screen titles/page headers
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: Constants.fontFamilyPoppins,
      color: AppColors.lightTextPrimary
    ),

    // subtitle/card titles
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: Constants.fontFamilyPoppins,
      color: AppColors.lightTextPrimary
    ),

    // body text (primary content)
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: Constants.fontFamilyPoppins,
      color: AppColors.lightTextPrimary
    ),

    // secondary text / description
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: Constants.fontFamilyPoppins,
      color: AppColors.lightTextSecondary
    ),

    // captions / labels
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: Constants.fontFamilyPoppins,
      color: AppColors.lightTextPrimary,
    ),

    // buttons
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: Constants.fontFamilyPoppins,
      color: AppColors.lightTextPrimary
    ),

    // small buttons / chips
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: Constants.fontFamilyPoppins,
      color: AppColors.lightTextPrimary
    )
  );

  static TextTheme darkTextTheme = TextTheme(
    // app title/branding
      displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          fontFamily: Constants.fontFamilyPoppins,
          color: AppColors.primary
      ),

      // section titles
      headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: Constants.fontFamilyPoppins,
          color: AppColors.primaryVariant1
      ),

      // screen titles/page headers
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: Constants.fontFamilyPoppins,
          color: AppColors.darkTextPrimary
      ),

      // subtitle/card titles
      titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: Constants.fontFamilyPoppins,
          color: AppColors.darkTextPrimary
      ),

      // body text (primary content)
      bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: Constants.fontFamilyPoppins,
          color: AppColors.darkTextPrimary
      ),

      // secondary text / description
      bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: Constants.fontFamilyPoppins,
          color: AppColors.darkTextSecondary
      ),

      // captions / labels
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: Constants.fontFamilyPoppins,
        color: AppColors.darkTextPrimary,
      ),

      // buttons
      labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: Constants.fontFamilyPoppins,
          color: AppColors.darkTextPrimary
      ),

      // small buttons / chips
      labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: Constants.fontFamilyPoppins,
          color: AppColors.darkTextPrimary
      )
  );
}