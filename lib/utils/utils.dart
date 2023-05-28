import 'package:calendar_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppUtils {
  AppUtils._();

  static const List<String> weekdays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];

  static bool isSameDay(DateTime first, DateTime second) {
    return first.year == second.year &&
        first.month == second.month &&
        first.day == second.day;
  }

  static void showSnackBar(BuildContext context, String title,
      [Color bgColor = AppColors.success]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        title,
      ),
      backgroundColor: bgColor,
    ));
  }

  static String emptyField(String prefilledText) {
    if (prefilledText.isEmpty) {
      return 'Not specified';
    }
    return prefilledText;
  }
}
