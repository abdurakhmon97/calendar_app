import 'package:calendar_app/data/model/event_details.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';

const _notSpecified = 'Not specified';

extension EventDetailsEntityExt on EventDetails {
  EventDetailsEntity toEntity() {
    return EventDetailsEntity(
      id: id ?? -1,
      name: name ?? _notSpecified,
      startTime: DateTime.tryParse(startTime ?? '') ?? DateTime.now(),
      endTime: DateTime.tryParse(endTime ?? '') ?? DateTime.now(),
      location: location ?? _notSpecified,
      priorityColor: priorityColor ?? 0,
      description: description ?? _notSpecified,
      reminder: reminder ?? 0,
      date: DateTime.tryParse(endTime ?? '') ?? DateTime.now(),
    );
  }
}

extension EventDetailsRawExt on EventDetailsEntity {
  EventDetails toRawData() {
    return EventDetails(
      id: id,
      name: name,
      startTime: startTime.toString(),
      endTime: endTime.toString(),
      location: location,
      priorityColor: priorityColor,
      description: description,
      reminder: reminder,
      date: date.toString(),
    );
  }
}
