import 'package:calendar_app/domain/entities/event_details_entity.dart';

abstract class EventsRepository {
  Future<List<EventDetailsEntity>> getEventsByDay(DateTime day);
}
