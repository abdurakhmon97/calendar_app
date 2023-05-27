import 'package:flutter/cupertino.dart';

class HomeScreenViewModel {
  final duration = const Duration(milliseconds: 300);
  final Curve curve = Curves.ease;
  DateTime currentDay = DateTime.now();

  late final int pageViewLength;

  final startYear = 1950;
  final endYear = 2950;

  final PageController pageController = PageController();

  void init() {
    final List<int> dateRange = [];
    for (int i = startYear; i <= endYear; i++) {
      dateRange.add(i);
    }
    pageViewLength = dateRange.length * 12;
  }

  void selectDay(DateTime selectedDay) {
    currentDay = selectedDay;
  }

  void nextMonth() {
    pageController.nextPage(
      duration: duration,
      curve: curve,
    );
  }

  void _pageChangeAnimation({
    required Duration duration,
    required Curve curve,
  }) {}
}
