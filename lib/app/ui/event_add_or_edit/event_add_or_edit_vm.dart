import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/domain/bloc/edit_or_add_bloc.dart';
import 'package:calendar_app/domain/bloc/home_bloc.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:calendar_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EventAddOrEditViewModel {
  Duration reminder = Duration.zero;
  int priorityColor = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController reminderController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  void init(EventDetailsEntity? eventToEdit) {
    if (eventToEdit != null) {
      nameController.text = eventToEdit.name;
      descriptionController.text = eventToEdit.description;
      locationController.text = eventToEdit.location;
      priorityColor = eventToEdit.priorityColor;
      reminder = Duration(minutes: eventToEdit.reminder);
      reminderController.text = eventToEdit.reminder.toString();
      timeController.text = eventToEdit.time;
    }
  }

  void createEvent({
    required BuildContext context,
    required DateTime selectedDay,
  }) {
    if (nameController.text.isEmpty || timeController.text.isEmpty) {
      AppUtils.showSnackBar(
        context,
        'Name and time must be specified',
        AppColors.error,
      );
      return;
    }
    context.read<EditOrAddBloc>().add(
          AddNewEvent(
            EventDetailsEntity(
              name: nameController.text,
              time: timeController.text,
              location: locationController.text,
              priorityColor: priorityColor,
              description: descriptionController.text,
              reminder: reminder.inMinutes,
              date: selectedDay.toString(),
            ),
          ),
        );
    context.read<HomeBloc>().add(HomeSelectDayEvent(selectedDay));
    AppUtils.showSnackBar(context, 'Event added successfully');
    context.pop();
  }

  void updateEvent({
    required BuildContext context,
    required DateTime selectedDay,
    required int eventId,
  }) {
    if (nameController.text.isEmpty || timeController.text.isEmpty) {
      AppUtils.showSnackBar(
        context,
        'Name and time must be specified',
        AppColors.error,
      );
      return;
    }
    final event = EventDetailsEntity(
      id: eventId,
      name: nameController.text,
      time: timeController.text,
      location: locationController.text,
      priorityColor: priorityColor,
      description: descriptionController.text,
      reminder: reminder.inMinutes,
      date: selectedDay.toString(),
    );
    context.read<EditOrAddBloc>().add(UpdateEvent(event));
    context.read<HomeBloc>().add(HomeSelectDayEvent(selectedDay));
    AppUtils.showSnackBar(context, 'Event updated successfully');
    context.pop(event);
  }

  void changePriorityColor(int index) => priorityColor = index;

  void setReminder(String minutes) => reminderController.text = minutes;

  void onBackTap(BuildContext context) => context.pop();
}
