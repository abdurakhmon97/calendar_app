part of '../bloc/home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeSelectDayEvent extends HomeEvent {
  final DateTime newSelectedDay;

  const HomeSelectDayEvent(this.newSelectedDay);

  @override
  List<Object> get props => [newSelectedDay];
}

class HomeChangeMonthEvent extends HomeEvent {
  final DateTime newFocusedMonth;

  const HomeChangeMonthEvent(this.newFocusedMonth);

  @override
  List<Object> get props => [newFocusedMonth];
}

class HomeExceedingRangeEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}
