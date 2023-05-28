import 'package:calendar_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  const AppTypography._();

  static const textSmall = TextStyle(
    fontSize: 8.0,
    height: 12.0 / 8.0,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w400,
  );

  static final textSmallWhite =
      textSmall.copyWith(color: AppColors.contrastWhite);

  static const textRegular = TextStyle(
    height: 15.0 / 10.0,
    fontSize: 10.0,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w400,
  );

  static final textRegularSecondary =
      textRegular.copyWith(color: AppColors.secondaryText);

  static const textSemiBold = TextStyle(
    height: 15.0 / 10.0,
    fontSize: 10.0,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w600,
  );

  static final textSemiBoldWhite =
      textSemiBold.copyWith(color: AppColors.contrastWhite);

  static const caption = TextStyle(
    height: 21.0 / 14.0,
    fontSize: 14.0,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w400,
  );

  static final captionMedium = caption.copyWith(fontWeight: FontWeight.w500);

  static final captionMediumWhite =
      captionMedium.copyWith(color: AppColors.contrastWhite);

  static final captionSemiBold = caption.copyWith(fontWeight: FontWeight.w600);

  static const caption2 = TextStyle(
    height: 18.0 / 12.0,
    fontSize: 12.0,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w500,
  );

  static final caption2White =
      caption2.copyWith(color: AppColors.contrastWhite);

  static final TextStyle caption2SemiBold = caption2.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final TextStyle caption2SemiBoldWhite = caption2SemiBold.copyWith(
    color: AppColors.contrastWhite,
  );

  static final caption2Secondary =
      caption2.copyWith(color: AppColors.secondaryText);

  static const title3 = TextStyle(
    fontSize: 26,
    height: 32 / 26,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w500,
  );

  static final title3SemiBold = title3.copyWith(fontWeight: FontWeight.w600);

  static final title3SemiBoldWhite =
      title3.copyWith(color: AppColors.contrastWhite);

  static final title3Secondary =
      title3.copyWith(color: AppColors.secondaryText);

  static final body2 = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    color: AppColors.robotoPrimaryText,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );

  static final body1 = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    color: AppColors.robotoPrimaryText,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );

  static final body1Poppins = body1.copyWith(
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  static final body1PoppinsCaption =
      body1Poppins.copyWith(color: AppColors.captionText);

  static final body1White = body1.copyWith(color: AppColors.contrastWhite);

  static final body1SemiBold = body1.copyWith(fontWeight: FontWeight.w600);

  static final body1SemiBoldWhite =
      body1SemiBold.copyWith(color: AppColors.contrastWhite);
}
