part of '../bloc/event_details_bloc.dart';

abstract class EventDetailsState extends Equatable {
  const EventDetailsState();
}

class EventDetailsInitial extends EventDetailsState {
  @override
  List<Object> get props => [];
}

class EditEventState extends EventDetailsState {
  final EventDetailsEntity eventDetailsEntity;

  const EditEventState(this.eventDetailsEntity);

  @override
  List<Object> get props => [eventDetailsEntity];
}

class DeleteEventState extends EventDetailsState {
  @override
  List<Object> get props => [];
}
