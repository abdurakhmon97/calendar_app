import 'package:calendar_app/app/ui/home/widgets/calendar/cell_builder.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:calendar_app/utils/utils.dart';
import 'package:flutter/material.dart';

class CalendarBody extends StatelessWidget {
  const CalendarBody({
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
        final currentDay = focusedMonthDays[index - (weekdayLength + skipGrid)];
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onSelectDay(context, currentDay),
          child: CellBuilder(
            day: currentDay,
            isChosen: AppUtils.isSameDay(currentDay, selectedDay),
          ),
        );
      },
    );
  }
}
