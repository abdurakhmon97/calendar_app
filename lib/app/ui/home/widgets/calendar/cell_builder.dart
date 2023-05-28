import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:flutter/material.dart';

class CellBuilder extends StatelessWidget {
  const CellBuilder({
    Key? key,
    required this.day,
    required this.isChosen,
  }) : super(key: key);

  final DateTime day;
  final bool isChosen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 4,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isChosen ? AppColors.primaryColor : AppColors.bgColor,
        shape: BoxShape.circle,
      ),
      child: Text(
        '${day.day}',
        style: isChosen
            ? AppTypography.caption2SemiBoldWhite
            : AppTypography.caption2,
      ),
    );
  }
}
