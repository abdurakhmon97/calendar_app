import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class EventAddOrEditViewModel {
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
    }
  }

  void changePriorityColor(int index) => priorityColor = index;

  void onBackTap(BuildContext context) => context.pop();
}
