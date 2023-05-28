part of '../bloc/home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeSelectDayState extends HomeState {
  final DateTime selectedDay;
  final List<EventDetailsEntity> events;

  const HomeSelectDayState({
    required this.selectedDay,
    required this.events,
  });

  @override
  List<Object> get props => [
        selectedDay,
        events,
      ];
}

class HomeChangeMonthState extends HomeState {
  final DateTime newMonth;

  const HomeChangeMonthState({
    required this.newMonth,
  });

  @override
  List<Object> get props => [newMonth];
}

class HomeExceedingRangeState extends HomeState {
  @override
  List<Object> get props => [];
}
