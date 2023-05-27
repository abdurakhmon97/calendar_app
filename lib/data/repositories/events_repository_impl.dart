import 'package:calendar_app/data/storage/db_helper.dart';
import 'package:calendar_app/domain/repositories/events_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: EventsRepository)
class EventsRepositoryImpl implements EventsRepository {
  EventsRepositoryImpl(this._databaseHelper);

  final DatabaseHelper _databaseHelper;

  @override
  Future<void> getEventsByDay(String day) async {}
}
