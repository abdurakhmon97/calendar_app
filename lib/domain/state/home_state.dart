part of '../bloc/home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSelectDayState extends HomeState {
  final DateTime selectedDay;

  const HomeSelectDayState(this.selectedDay);

  @override
  List<Object> get props => [selectedDay];
}
