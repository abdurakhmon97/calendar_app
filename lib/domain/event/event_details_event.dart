part of '../bloc/event_details_bloc.dart';

abstract class EventDetailsEvent extends Equatable {
  const EventDetailsEvent();
}

class EditEvent extends EventDetailsEvent {
  final EventDetailsEntity event;

  const EditEvent(this.event);

  @override
  List<Object?> get props => [event];
}

class DeleteEvent extends EventDetailsEvent {
  final int id;

  const DeleteEvent(this.id);

  @override
  List<Object?> get props => [id];
}
