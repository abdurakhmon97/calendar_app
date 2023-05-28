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