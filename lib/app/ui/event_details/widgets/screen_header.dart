import 'package:calendar_app/app/ui/widgets/icon_with_title.dart';
import 'package:calendar_app/core/constants/assets.dart';
import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:calendar_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({
    Key? key,
    required this.event,
    required this.onEdit,
    required this.onBackTap,
  }) : super(key: key);

  final EventDetailsEntity event;
  final VoidCallback onEdit;
  final VoidCallback onBackTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(28, 18, 28, 20),
      decoration: BoxDecoration(
        color: AppColorUtils.priorityColorMap[event.priorityColor],
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onBackTap,
                child: Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.contrastWhite,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(AppIcons.chevronLeft),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onEdit,
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.edit),
                    const SizedBox(width: 4),
                    Text(
                      'Edit',
                      style: AppTypography.captionMediumWhite,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            AppUtils.emptyField(event.name),
            style: AppTypography.title3SemiBoldWhite,
          ),
          Text(
            AppUtils.emptyField(event.description),
            style: AppTypography.textSmallWhite,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          IconWithTitle(
            icon: AppIcons.time,
            title: event.time,
            prioritizedColor: AppColors.contrastWhite,
          ),
          const SizedBox(height: 10),
          IconWithTitle(
            icon: AppIcons.location,
            title: event.location,
            prioritizedColor: AppColors.contrastWhite,
          ),
        ],
      ),
    );
  }
}
