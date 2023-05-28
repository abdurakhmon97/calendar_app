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

class HomeExceedingRangeState extends HomeState {
  @override
  List<Object> get props => [];
}
