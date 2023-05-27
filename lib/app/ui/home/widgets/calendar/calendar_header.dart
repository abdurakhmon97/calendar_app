import 'package:calendar_app/core/constants/assets.dart';
import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({
    Key? key,
    required this.currentMonth,
    required this.onPreviousPage,
    required this.onNextPage,
  }) : super(key: key);

  final DateTime currentMonth;
  final VoidCallback onPreviousPage;
  final VoidCallback onNextPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('MMMM').format(currentMonth),
              style: AppTypography.captionSemiBold,
            ),
            Row(
              children: [
                _CircleArrow(
                  icon: SvgPicture.asset(AppIcons.arrowLeft),
                  onTap: onPreviousPage,
                ),
                const SizedBox(width: 10),
                _CircleArrow(
                  icon: SvgPicture.asset(AppIcons.arrowRight),
                  onTap: onNextPage,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _CircleArrow extends StatelessWidget {
  const _CircleArrow({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final SvgPicture icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 23,
        width: 23,
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.arrowBtnBg,
        ),
        child: icon,
      ),
    );
  }
}
