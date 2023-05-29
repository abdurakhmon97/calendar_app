//ignore_for_file: use_build_context_synchronously

import 'package:calendar_app/app/navigation/app_route.dart';
import 'package:calendar_app/app/navigation/arguments/event_add_or_edit_arguments.dart';
import 'package:calendar_app/app/ui/event_add_or_edit/event_add_or_edit_vm.dart';
import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/domain/bloc/event_details_bloc.dart';
import 'package:calendar_app/domain/bloc/home_bloc.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:calendar_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EventDetailsViewModel {
  EventDetailsEntity event;

  EventDetailsViewModel(this.event);

  void onBackTap(BuildContext context) => context.pop();

  void onEditEvent({
    required BuildContext context,
    required DateTime chosenDay,
  }) async {
    final updatedEvent = await context.push(
      '${AppRoute.home}${AppRoute.eventAddOrEdit}',
      extra: EventAddOrEditArguments(
        vm: EventAddOrEditViewModel(),
        chosenDay: chosenDay,
        eventToEdit: event,
      ),
    );
    if (updatedEvent is EventDetailsEntity) {
      event = updatedEvent;
      context.read<EventDetailsBloc>().add(EditEvent(updatedEvent));
    }
  }

  void onDeleteEvent({
    required BuildContext context,
    required DateTime selectedDay,
  }) async {
    if (event.id == null) {
      AppUtils.showSnackBar(
        context,
        'Failed to find the id of the event',
        AppColors.error,
      );
      return;
    }
    context.read<EventDetailsBloc>().add(DeleteEvent(event.id!));
    context.read<HomeBloc>().add(HomeSelectDayEvent(selectedDay));
    AppUtils.showSnackBar(context, 'Event deleted successfully');
    context.go(AppRoute.home);
  }
}
