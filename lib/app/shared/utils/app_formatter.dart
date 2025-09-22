import 'package:flutter/material.dart';

class AppFormatter {
  static String formatDate(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }
}