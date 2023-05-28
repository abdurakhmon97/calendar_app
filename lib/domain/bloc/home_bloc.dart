import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:calendar_app/domain/repositories/events_repository.dart';
import 'package:equatable/equatable.dart';

part '../event/home_event.dart';

part '../state/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._eventsRepository)
      : super(HomeSelectDayState(
          selectedDay: DateTime.now(),
          events: const [],
        )) {
    on<HomeSelectDayEvent>(_onDaySelected);
    on<HomeChangeMonthEvent>(_onChangeMonth);
    on<HomeExceedingRangeEvent>(_onRangeExceeded);
  }

  //we can also create home bloc outside of material app, and inject the constructor instead of field
  final EventsRepository _eventsRepository;

  FutureOr<void> _onDaySelected(
      HomeSelectDayEvent event, Emitter<HomeState> emit) async {
    final events = await _eventsRepository.getEventsByDay(event.newSelectedDay);
    emit(HomeSelectDayState(
      selectedDay: event.newSelectedDay,
      events: events,
    ));
  }

  FutureOr<void> _onRangeExceeded(
      HomeExceedingRangeEvent event, Emitter<HomeState> emit) {
    emit(HomeExceedingRangeState());
  }

  FutureOr<void> _onChangeMonth(
      HomeChangeMonthEvent event, Emitter<HomeState> emit) async {
    emit(HomeChangeMonthState(newMonth: event.newFocusedMonth));
  }
}
