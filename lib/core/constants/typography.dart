import 'package:calendar_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTypography {
  const AppTypography._();

  static const textRegular = TextStyle(
    height: 17.0 / 14.0,
    fontSize: 14.0,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w500,
  );

  static const title3 = TextStyle(
    fontSize: 26,
    height: 32 / 26,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w500,
  );
}