import 'package:flutter/material.dart';

const _calendarHeight = 220.0;

class CalendarPageView extends StatelessWidget {
  const CalendarPageView({
    Key? key,
    required this.pageController,
    required this.chosenDay,
    required this.dateRange,
  }) : super(key: key);

  final PageController pageController;
  final DateTime chosenDay;
  final int dateRange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _calendarHeight,
      child: PageView.builder(
        itemBuilder: (_, index) {

        },
        itemCount: dateRange,
      ),
    );
  }
}
