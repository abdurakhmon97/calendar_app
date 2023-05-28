import 'package:calendar_app/app/ui/event_add_or_edit/event_add_or_edit_vm.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:equatable/equatable.dart';

class EventAddOrEditArguments with EquatableMixin {
  final EventAddOrEditViewModel vm;
  final DateTime chosenDay;
  final EventDetailsEntity? eventToEdit;

  const EventAddOrEditArguments({
    required this.vm,
    required this.chosenDay,
    this.eventToEdit,
  });

  @override
  List<Object?> get props => [
        vm,
        chosenDay,
        eventToEdit,
      ];
}
