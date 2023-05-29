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
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return _database!;
  }

  static FutureOr<void> _onCreate(Database db, _) async {
    await db.execute(
        '''CREATE TABLE $_tableName (id INTEGER PRIMARY KEY autoincrement, 
        name STRING,
        description STRING,
        location STRING,
        reminder INTEGER,
        priorityColor INTEGER,
        time STRING,
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
    required EventDetails eventDetails,
  }) async =>
      await _database!.insert(
        _tableName,
        eventDetails.toJson(),
      );

  Future<void> delete(int id) async =>
      await _database!.rawDelete("DELETE from $_tableName where id=$id");

  Future<void> update({
    required EventDetails eventDetails,
  }) async =>
      await _database!.update(
        _tableName,
        eventDetails.toJson(),
        where: 'id = ?',
        whereArgs: [eventDetails.id],
      );

  Future close() async {
    await _database?.close();
    _database = null;
  }
}
