import 'package:calendar_app/core/constants/assets.dart';
import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Column(
      children: [
        Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColorUtils
                .priorityColorMap[eventDetailsEntity.priorityColor],
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
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
                eventDetailsEntity.name,
                style: AppTypography.captionSemiBold.copyWith(
                  color: AppColorUtils
                      .textColorByPriorityColorMap[eventDetailsEntity.priorityColor]!,
                ),
                maxLines: 1,
                softWrap: false,
              ),
              Text(
                eventDetailsEntity.description,
                style: AppTypography.textSmall.copyWith(
                  color: AppColorUtils
                      .textColorByPriorityColorMap[eventDetailsEntity.priorityColor]!,
                ),
                maxLines: 1,
                softWrap: false,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.time,
                    colorFilter: ColorFilter.mode(
                      AppColorUtils
                          .textColorByPriorityColorMap[eventDetailsEntity.priorityColor]!,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${eventDetailsEntity.startTime.toString().substring(0, 4)} - ${eventDetailsEntity.endTime.toString().substring(0, 4)}',
                    style: AppTypography.textRegular.copyWith(
                      color: AppColorUtils
                          .textColorByPriorityColorMap[eventDetailsEntity.priorityColor]!,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset(
                    AppIcons.location,
                    colorFilter: ColorFilter.mode(
                      AppColorUtils
                          .textColorByPriorityColorMap[eventDetailsEntity.priorityColor]!,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      eventDetailsEntity.location,
                      style: AppTypography.textRegular.copyWith(
                        color: AppColorUtils.textColorByPriorityColorMap[
                            eventDetailsEntity.priorityColor]!,
                      ),
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ],
    );
  }
}
