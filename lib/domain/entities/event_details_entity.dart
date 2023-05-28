import 'package:equatable/equatable.dart';

class EventDetailsEntity with EquatableMixin {
  final String name;
  final String time;
  final String location;
  final int priorityColor;
  final String description;
  final int reminder;
  final String date;
  final int? id;

  const EventDetailsEntity({
    required this.name,
    required this.time,
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
        time,
        location,
        priorityColor,
        description,
        reminder,
        date,
        id,
      ];
}
