import 'package:bloc/bloc.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:equatable/equatable.dart';

part '../event/event_details_event.dart';
part '../state/event_details_state.dart';

class EventDetailsBloc extends Bloc<EventDetailsEvent, EventDetailsState> {
  EventDetailsBloc() : super(EventDetailsInitial()) {
    on<EventDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
