import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:calendar_app/core/di/inject.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:calendar_app/domain/repositories/events_repository.dart';
import 'package:equatable/equatable.dart';

part '../event/edit_or_add_event.dart';

part '../state/edit_or_add_state.dart';

class EditOrAddBloc extends Bloc<EditOrAddEvent, EditOrAddState> {
  EditOrAddBloc() : super(EditOrAddInitial()) {
    on<AddNewEvent>(_onAddNewEvent);
  }

  final EventsRepository _eventsRepository = inject();

  FutureOr<void> _onAddNewEvent(
      AddNewEvent event, Emitter<EditOrAddState> emit) async {
    await _eventsRepository.createNewEvent(event.event);
    emit(AddNewEventState());
  }
}
