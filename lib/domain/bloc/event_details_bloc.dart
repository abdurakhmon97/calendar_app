import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:calendar_app/core/di/inject.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:calendar_app/domain/repositories/events_repository.dart';
import 'package:equatable/equatable.dart';

part '../event/event_details_event.dart';

part '../state/event_details_state.dart';

class EventDetailsBloc extends Bloc<EventDetailsEvent, EventDetailsState> {
  EventDetailsBloc() : super(EventDetailsInitial()) {
    on<EditEvent>(_onEditEvent);
    on<DeleteEvent>(_onDeleteEvent);
  }

  final EventsRepository _eventsRepository = inject();

  FutureOr<void> _onEditEvent(
      EditEvent event, Emitter<EventDetailsState> emit) async {
    emit(EditEventState(event.event));
  }

  FutureOr<void> _onDeleteEvent(
      DeleteEvent event, Emitter<EventDetailsState> emit) async {
    await _eventsRepository.deleteEvent(event.id);
    emit(DeleteEventState());
  }
}
