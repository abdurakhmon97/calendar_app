import 'package:equatable/equatable.dart';

class EventDetailsEntity with EquatableMixin {
  final int id;
  final String name;
  final DateTime startTime;
  final DateTime endTime;
  final String location;
  final int priorityColor;
  final String description;
  final int reminder;
  final DateTime date;

  const EventDetailsEntity({
    required this.id,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.priorityColor,
    required this.description,
    required this.reminder,
    required this.date,
  });

  @override
  List<Object> get props => [
        id,
        name,
        startTime,
        endTime,
        location,
        priorityColor,
        description,
        reminder,
        date,
      ];
}
