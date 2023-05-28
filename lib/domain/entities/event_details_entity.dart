import 'package:equatable/equatable.dart';

class EventDetailsEntity with EquatableMixin {
  final String name;
  final DateTime startTime;
  final DateTime endTime;
  final String location;
  final int priorityColor;
  final String description;
  final int reminder;
  final DateTime date;
  final int? id;

  const EventDetailsEntity({
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.priorityColor,
    required this.description,
    required this.reminder,
    required this.date,
    this.id,
  });

  @override
  List<Object?> get props => [
        name,
        startTime,
        endTime,
        location,
        priorityColor,
        description,
        reminder,
        date,
        id,
      ];
}
