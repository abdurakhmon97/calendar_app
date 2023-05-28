import 'package:calendar_app/app/ui/event_details/event_details_vm.dart';
import 'package:equatable/equatable.dart';

class EventDetailsScreenArguments with EquatableMixin {
  final EventDetailsViewModel vm;
  final DateTime chosenDay;

  const EventDetailsScreenArguments({
    required this.vm,
    required this.chosenDay,
  });

  @override
  List<Object> get props => [
        vm,
        chosenDay,
      ];
}
