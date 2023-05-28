part of '../bloc/edit_or_add_bloc.dart';

abstract class EditOrAddEvent extends Equatable {
  const EditOrAddEvent();
}

class AddNewEvent extends EditOrAddEvent {
  final EventDetailsEntity event;

  const AddNewEvent(this.event);

  @override
  List<Object> get props => [event];
}
