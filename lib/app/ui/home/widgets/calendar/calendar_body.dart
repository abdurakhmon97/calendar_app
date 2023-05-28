import 'package:calendar_app/app/ui/home/widgets/calendar/cell_builder.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:calendar_app/utils/utils.dart';
import 'package:flutter/material.dart';

class CalendarBody extends StatelessWidget {
  CalendarBody({
    Key? key,
    required this.focusedMonthDays,
    required this.selectedDay,
    required this.onSelectDay,
  }) : super(key: key);

  final List<DateTime> focusedMonthDays;
  final DateTime selectedDay;
  final Function(BuildContext, DateTime) onSelectDay;

  @override
  Widget build(BuildContext context) {
    if (focusedMonthDays.isEmpty) {
      return const SizedBox.shrink();
    }
    //this many times we should skip the grid to align the day by its weekday
    final skipGrid = focusedMonthDays.first.weekday - 1;
    final weekdayLength = AppUtils.weekdays.length;

    final gridLength = focusedMonthDays.length + skipGrid + weekdayLength;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: gridLength,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemBuilder: (_, index) {
        if (index < 7) {
          return Center(
            child: Text(
              AppUtils.weekdays[index],
              style: AppTypography.caption2Secondary,
            ),
          );
        }
        if ((index - weekdayLength) < skipGrid) {
          return const SizedBox.shrink();
        }
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onSelectDay(
              context, focusedMonthDays[index - (weekdayLength + skipGrid)]),
          child: CellBuilder(
            day: focusedMonthDays[index - (weekdayLength + skipGrid)],
            isChosen: AppUtils.isSameDay(
              focusedMonthDays[index - (weekdayLength + skipGrid)],
              selectedDay,
            ),
            events: [entity, entity, entity],
          ),
        );
      },
    );
  }

  EventDetailsEntity entity = EventDetailsEntity(
    id: 1,
    name: 'name',
    startTime: DateTime.now(),
    endTime: DateTime.now(),
    location: 'location',
    priorityColor: 1,
    description: 'description',
    reminder: 1,
    date: DateTime.now(),
  );
}
