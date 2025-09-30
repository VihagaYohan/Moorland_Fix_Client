import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppFormatter {
  static String formatDate(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }

  static String formatDateWithMonth(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }
}