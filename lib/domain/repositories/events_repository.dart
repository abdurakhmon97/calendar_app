import 'package:calendar_app/domain/entities/event_details_entity.dart';

abstract class EventsRepository {
  Future<List<EventDetailsEntity>> getEventsByDay(DateTime day);

  Future<void> createNewEvent(EventDetailsEntity eventDetailsEntity);

  Future<void> updateEvent(EventDetailsEntity eventDetailsEntity);

  Future<void> deleteEvent(int id);
}
