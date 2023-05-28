import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:calendar_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconWithTitle extends StatelessWidget {
  const IconWithTitle({
    Key? key,
    required this.icon,
    required this.title,
    this.colorIndex,
    this.prioritizedColor,
  }) : super(key: key);

  final String icon;
  final String title;
  final int? colorIndex;
  final Color? prioritizedColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            prioritizedColor ??
                AppColorUtils.textColorByPriorityColorMap[colorIndex]!,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          AppUtils.emptyField(title),
          style: AppTypography.textRegular.copyWith(
            color: prioritizedColor ??
                AppColorUtils.textColorByPriorityColorMap[colorIndex]!,
          ),
        ),
      ],
    );
  }
}
