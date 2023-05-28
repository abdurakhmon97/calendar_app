import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primaryColor = Color(0xFF009FEE);
  static const bgColor = Color(0xFFF8F8F8);
  static const secondaryBgColor = Color(0xFFE5E5E5);
  static const arrowBtnBg = Color(0xFFEFEFEF);
  static const textFieldBg = Color(0xFFF3F4F6);

  static const success = Colors.green;
  static const error = Colors.red;

  static const Color primaryText = Color(0xFF292929);
  static const Color secondaryText = Color(0xFF969696);
  static const Color contrastWhite = Color(0xFFFFFFFF);
  static const Color robotoPrimaryText = Color(0xFF111827);

  static const Color priorityMinimum = Color(0xFFF6CFC6);
  static const Color priorityNormal = Color(0xFF009FEE);
  static const Color priorityWarning = Color(0xFFEE8F00);
  static const Color prioritySevere = Color(0xFFEE2B00);

  static const Color priorityMinimumText = Color(0xFFF5A795);
  static const Color priorityNormalText= Color(0xFF056EA1);
  static const Color priorityWarningText = Color(0xFFB86E00);
  static const Color prioritySevereText= Color(0xFFBF2200);

  static const Color iconGrey = Color(0xFF6B7280);
}

class AppColorUtils {
  AppColorUtils._();

  static const priorityColorMap = {
    0: AppColors.priorityMinimum,
    1: AppColors.priorityNormal,
    2: AppColors.priorityWarning,
    3: AppColors.prioritySevere,
  };

  static const textColorByPriorityColorMap = {
    0: AppColors.priorityMinimumText,
    1: AppColors.priorityNormalText,
    2: AppColors.priorityWarningText,
    3: AppColors.prioritySevereText,
  };
}
