import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:equatable/equatable.dart';

class DayWithEventsEntity with EquatableMixin {
  final DateTime day;
  final List<EventDetailsEntity> events;

  const DayWithEventsEntity({
    required this.day,
    required this.events,
  });

  @override
  List<Object?> get props => [
        day,
        events,
      ];
}
