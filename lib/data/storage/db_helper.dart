import 'dart:async';
import 'package:calendar_app/data/model/event_details.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const _tableName = 'events_table';

class DatabaseHelper {
  Database? _database;

  bool get _isOpen => _database != null;

  Future<Database> open() async {
    if (_isOpen) {
      return _database!;
    }
    final dbPath = await getDatabasesPath();
    final path = join(
      dbPath,
      'calendar_app.db',
    );
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  static FutureOr<void> _onCreate(Database db, _) async {
    await db.execute(
        '''CREATE TABLE $_tableName (id STRING PRIMARY KEY autoincrement, 
        name STRING,
        description STRING,
        location STRING,
        reminder INTEGER,
        priorityColor INTEGER,
        startTime STRING,
        endTime STRING,
        date String
      )''');
  }

  Future<List<EventDetails>> getEventsByDay(DateTime selectedDay) async {
    List<EventDetails> eventDetails = [];
    final rawEventDetails = await _database!.query(
      _tableName,
      where: 'date = ?',
      whereArgs: [selectedDay.toString()],
    );
    for (var element in rawEventDetails) {
      eventDetails.add(EventDetails.fromJson(element));
    }
    return eventDetails;
  }

  Future<int?> insert({
    required String table,
    required EventDetails eventDetails,
  }) async =>
      await _database!.insert(
        table,
        eventDetails.toJson(),
      );

  Future<void> delete(int id) async =>
      await _database!.rawDelete("DELETE from $_tableName where id=$id");

  Future<dynamic> update({
    required String table,
    required EventDetails eventDetails,
  }) async =>
      await _database!.update(
        table,
        eventDetails.toJson(),
        where: 'id = ?',
        whereArgs: [eventDetails.id],
      );

  Future close() async {
    await _database?.close();
    _database = null;
  }
}
