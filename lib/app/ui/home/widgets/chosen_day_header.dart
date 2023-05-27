import 'package:calendar_app/core/constants/assets.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ChosenDayHeader extends StatelessWidget {
  const ChosenDayHeader({
    Key? key,
    required this.day,
  }) : super(key: key);
  final DateTime day;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DateFormat('EEEE').format(day),
            style: AppTypography.captionSemiBold,
          ),
          Row(
            children: [
              Text(
                DateFormat('d MMMM y').format(day),
                style: AppTypography.textRegular,
              ),
              const SizedBox(width: 4),
              SvgPicture.asset(AppIcons.arrowDown),
            ],
          ),
        ],
      ),
    );
  }
}
