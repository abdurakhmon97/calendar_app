import 'package:calendar_app/app/ui/widgets/icon_with_title.dart';
import 'package:calendar_app/core/constants/assets.dart';
import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:calendar_app/utils/utils.dart';
import 'package:flutter/material.dart';

class SingleEvent extends StatelessWidget {
  const SingleEvent({
    Key? key,
    required this.eventDetailsEntity,
    required this.onEventTap,
  }) : super(key: key);

  final EventDetailsEntity eventDetailsEntity;
  final VoidCallback onEventTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onEventTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Container(
            height: 10,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColorUtils
                  .priorityColorMap[eventDetailsEntity.priorityColor],
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColorUtils
                  .priorityColorMap[eventDetailsEntity.priorityColor]!
                  .withOpacity(.2),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  AppUtils.emptyField(eventDetailsEntity.name),
                  style: AppTypography.captionSemiBold.copyWith(
                    color: AppColorUtils.textColorByPriorityColorMap[
                        eventDetailsEntity.priorityColor]!,
                  ),
                  maxLines: 1,
                  softWrap: false,
                ),
                Text(
                  AppUtils.emptyField(eventDetailsEntity.description),
                  style: AppTypography.textSmall.copyWith(
                    color: AppColorUtils.textColorByPriorityColorMap[
                        eventDetailsEntity.priorityColor]!,
                  ),
                  maxLines: 1,
                  softWrap: false,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    IconWithTitle(
                      icon: AppIcons.time,
                      title: eventDetailsEntity.time,
                      colorIndex: eventDetailsEntity.priorityColor,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: IconWithTitle(
                        icon: AppIcons.location,
                        title: eventDetailsEntity.location,
                        colorIndex: eventDetailsEntity.priorityColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
