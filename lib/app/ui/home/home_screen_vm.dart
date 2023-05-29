import 'package:calendar_app/app/navigation/app_route.dart';
import 'package:calendar_app/app/navigation/arguments/event_add_or_edit_arguments.dart';
import 'package:calendar_app/app/navigation/arguments/event_details_screen_arguments.dart';
import 'package:calendar_app/app/ui/event_add_or_edit/event_add_or_edit_vm.dart';
import 'package:calendar_app/app/ui/event_details/event_details_vm.dart';
import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/domain/bloc/home_bloc.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:calendar_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreenViewModel {
  DateTime focusedDay = DateTime.now();
  late DateTime selectedDay = DateTime(
    focusedDay.year,
    focusedDay.month,
    focusedDay.day,
  );
  List<DateTime> focusedMonthDays = [];

  //can be customized here
  final _startYear = DateTime.now().year;
  final _endYear = DateTime.now().year;

  void init(BuildContext context) {
    focusedMonthDays = _getDaysOfMonth(selectedDay);
    context.read<HomeBloc>().add(HomeSelectDayEvent(selectedDay));
  }

  void selectDay({
    required BuildContext context,
    required DateTime chosenDay,
  }) {
    selectedDay = chosenDay;
    context.read<HomeBloc>().add(HomeSelectDayEvent(chosenDay));
  }

  void nextMonth(BuildContext context) {
    final newFocusedDay = DateTime(focusedDay.year, focusedDay.month + 1, 15);
    if (newFocusedDay.year > _endYear) {
      AppUtils.showSnackBar(
        context,
        'Max year must be $_endYear',
        AppColors.error,
      );
      return;
    }
    focusedDay = newFocusedDay;
    focusedMonthDays = _getDaysOfMonth(focusedDay);
    context.read<HomeBloc>().add(HomeChangeMonthEvent(focusedDay));
  }

  void previousMonth(BuildContext context) {
    final newFocusedDay = DateTime(focusedDay.year, focusedDay.month - 1, 15);
    if (newFocusedDay.year < _startYear) {
      AppUtils.showSnackBar(
        context,
        'Least year must be $_startYear',
        AppColors.error,
      );
      return;
    }
    focusedDay = newFocusedDay;
    focusedMonthDays = _getDaysOfMonth(focusedDay);
    context.read<HomeBloc>().add(HomeChangeMonthEvent(focusedDay));
  }

  List<DateTime> _getDaysOfMonth(DateTime chosenDay) {
    List<DateTime> days = [];
    final start = DateTime(chosenDay.year, chosenDay.month, 1);
    final end = DateTime(chosenDay.year, chosenDay.month + 1, 0);
    for (int i = 0; i <= end.difference(start).inDays; i++) {
      days.add(start.add(Duration(days: i)));
    }
    return days;
  }

  void onAddEvent(BuildContext context) => context.push(
        '${AppRoute.home}${AppRoute.eventAddOrEdit}',
        extra: EventAddOrEditArguments(
          vm: EventAddOrEditViewModel(),
          chosenDay: selectedDay,
        ),
      );

  void onEditEvent({
    required BuildContext context,
    required EventDetailsEntity event,
  }) {
    context.push(
      '${AppRoute.home}${AppRoute.eventDetails}',
      extra: EventDetailsScreenArguments(
        vm: EventDetailsViewModel(event),
        chosenDay: selectedDay,
      ),
    );
  }
}
