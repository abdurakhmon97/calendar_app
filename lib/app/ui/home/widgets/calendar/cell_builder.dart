import 'dart:math' as math;
import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:flutter/material.dart';

class CellBuilder extends StatelessWidget {
  const CellBuilder({
    Key? key,
    required this.day,
    required this.isChosen,
    required this.events,
  }) : super(key: key);

  final DateTime day;
  final bool isChosen;
  final List<EventDetailsEntity> events;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
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
        ),
        if (events.isNotEmpty) ...[
          const SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              math.min(3, events.length),
              (index) => Container(
                height: 4,
                width: 4,
                margin: index == 1
                    ? const EdgeInsets.symmetric(horizontal: 4)
                    : EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: AppColorUtils
                      .priorityColorMap[events[index].priorityColor],
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
