import 'dart:developer';
import 'package:calendar_app/data/mappers/event_details_mapper.dart';
import 'package:calendar_app/data/storage/db_helper.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:calendar_app/domain/repositories/events_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: EventsRepository)
class EventsRepositoryImpl implements EventsRepository {
  EventsRepositoryImpl(this._databaseHelper);

  final DatabaseHelper _databaseHelper;

  @override
  Future<List<EventDetailsEntity>> getEventsByDay(DateTime day) async {
    try {
      List<EventDetailsEntity> result = [];
      final rawList = await _databaseHelper.getEventsByDay(day);
      for (final rawEvent in rawList) {
        result.add(rawEvent.toEntity());
      }
      return result;
    } on Object catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Future<void> createNewEvent(EventDetailsEntity eventDetailsEntity) async {
    try {
      await _databaseHelper.insert(
          eventDetails: eventDetailsEntity.toRawData());
    } on Object catch (e) {
      log(e.toString());
    }
  }
}
