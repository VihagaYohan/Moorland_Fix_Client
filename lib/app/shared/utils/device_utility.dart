import 'dart:convert';

import 'package:flutter/material.dart';
// theme
import 'package:moorland_fix/app/theme/index.dart';

// shared
import '../index.dart';

// domain entity
import 'package:moorland_fix/app/features/auth/domain/entities/_index.dart';

class DeviceUtils {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static bool isDarkMode(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }

  // get user profile
  static Future<UserEntity?> getUserProfile() async {
    final storage = await EncryptStorage.create();
    final userDataResponse =  await storage.getValue<String>(Constants.userKey);
    if(userDataResponse?.isEmpty == false) {
      Map<String,dynamic> userData = json.decode(userDataResponse!);
      UserEntity userEntity = UserEntity.fromJson(userData);
      return userEntity;
    }
    return null;
  }

  // show dialog
  static Future<T?> showAlertDialog<T>(
    BuildContext context,
    title,
    content,
    buttonTitle,
    buttonPress,
  ) async {
    return showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: AppColors.primaryVariant1,
            fontWeight: FontWeight.w700),
          ),
          content: Text(
            content,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium,
          ),
        );
      },
    );
  }

  // show date picker
  static Future<DateTime?> getDatePicker<T>(
      BuildContext context
      ) async {
    DateTime firstDate = DateTime(1900);
    DateTime lastDate = DateTime(2100);
    final brightness = isDarkMode(context);

    return await showDatePicker(context: context, firstDate: firstDate, lastDate: lastDate,
    initialEntryMode: DatePickerEntryMode.calendarOnly,
    helpText: "Select a date");
  }
}
