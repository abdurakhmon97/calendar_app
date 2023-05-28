import 'package:calendar_app/domain/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenViewModel {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  List<DateTime> focusedMonthDays = [];

  final startYear = 1950;
  final endYear = 2950;

  void init() {
    focusedMonthDays = getDaysOfMonth(selectedDay);
  }

  void selectDay({
    required BuildContext context,
    required DateTime chosenDay,
  }) {
    selectedDay = chosenDay;
    BlocProvider.of<HomeBloc>(context).add(HomeSelectDayEvent(chosenDay));
  }

  void nextMonth(BuildContext context) {
    focusedDay = DateTime(focusedDay.year, focusedDay.month + 1, 15);
    focusedMonthDays = getDaysOfMonth(focusedDay);
    BlocProvider.of<HomeBloc>(context).add(HomeSelectDayEvent(focusedDay));
  }

  void previousMonth(BuildContext context) {
    focusedDay = DateTime(focusedDay.year, focusedDay.month - 1, 15);
    focusedMonthDays = getDaysOfMonth(focusedDay);
    BlocProvider.of<HomeBloc>(context).add(HomeSelectDayEvent(focusedDay));
  }

  List<DateTime> getDaysOfMonth(DateTime chosenDay) {
    List<DateTime> days = [];
    final start = DateTime(chosenDay.year, chosenDay.month, 1);
    final end = DateTime(chosenDay.year, chosenDay.month + 1, 0);
    for (int i = 0; i <= end.difference(start).inDays; i++) {
      days.add(start.add(Duration(days: i)));
    }
    return days;
  }
}
