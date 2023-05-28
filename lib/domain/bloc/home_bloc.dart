import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '../event/home_event.dart';

part '../state/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeSelectDayEvent>(_onDaySelected);
  }

  FutureOr<void> _onDaySelected(
      HomeSelectDayEvent event, Emitter<HomeState> emit) {
    emit(HomeSelectDayState(event.newSelectedDay));
  }
}
