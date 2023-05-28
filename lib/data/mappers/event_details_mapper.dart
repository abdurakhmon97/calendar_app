import 'package:calendar_app/data/model/event_details.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';

extension EventDetailsEntityExt on EventDetails {
  EventDetailsEntity toEntity() {
    return EventDetailsEntity(
      id: id,
      name: name ?? '',
      time: time ?? '',
      location: location ?? '',
      priorityColor: priorityColor ?? 0,
      description: description ?? '',
      reminder: reminder ?? 0,
      date: date ?? '',
    );
  }
}

extension EventDetailsRawExt on EventDetailsEntity {
  EventDetails toRawData() {
    return EventDetails(
      id: id,
      name: name,
      time: time,
      location: location,
      priorityColor: priorityColor,
      description: description,
      reminder: reminder,
      date: date,
    );
  }
}
