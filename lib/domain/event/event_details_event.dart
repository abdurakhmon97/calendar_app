part of '../bloc/event_details_bloc.dart';

abstract class EventDetailsEvent extends Equatable {
  const EventDetailsEvent();
}

class EditEvent extends EventDetailsEvent {
  final EventDetailsEntity eventDetailsEntity;

  const EditEvent(this.eventDetailsEntity);

  @override
  List<Object?> get props => [eventDetailsEntity];
}

class DeleteEvent extends EventDetailsEvent {
  final int id;

  const DeleteEvent(this.id);

  @override
  List<Object?> get props => [id];
}
