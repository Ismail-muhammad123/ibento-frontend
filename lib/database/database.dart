import 'package:ibento/data/data.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io';

class DatabaseClass {
  final String dbName = "Bookings";
  DatabaseClass() {
    sqfliteFfiInit();
  }

  Future<Database> initiateDB() async {
    var databaseFactory = databaseFactoryFfi;
    // in memory data base for testing
    Directory? appDocDir = await getApplicationSupportDirectory();
    String path = join(appDocDir.path, 'DATABASE.db');
    var db = await databaseFactory.openDatabase(path);

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $dbName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        eventName TEXT,
        startTime INT,
        endTime INT,
        createdAt INT,
        name TEXT,
        phone TEXT,
        email TEXT NULL,
        address TEXT NULL,
        amountPaid INT,
        balance INT,
        attended INT,
        canceled INT
    )
    ''');

    return db;
  }

  insert(Event event) async {
    var db = await initiateDB();

    Map<String, dynamic> eventMap = event.toMap();

    int from = eventMap['startTime'];
    int to = eventMap['endTime'];

    // check if there is any bookong that complicts the date of the new event and that is not canceled.
    List<Map> r = await db.rawQuery(
        "SELECT eventName FROM $dbName WHERE (canceled = 0) AND ((startTime BETWEEN $from AND $to) OR (endTime BETWEEN $from AND $to) OR ($from BETWEEN startTime AND endTime) OR ($to BETWEEN startTime AND endTime))");

    // if yes, return with a vaue of 0

    if (r.isNotEmpty) {
      return 0;
    }

    // if not, insert the event into data base

    var id = await db.insert(dbName, event.toMap());

    db.close();

    return id;
  }

  updateEvent(Event event) async {
    var db = await initiateDB();

    Map<String, dynamic> eventMap = event.toMap();

    int from = eventMap['startTime'];
    int to = eventMap['endTime'];

    List<Map> r = await db.rawQuery(
        "SELECT eventName FROM $dbName WHERE (id!=${event.id}) AND ((startTime BETWEEN $from AND $to) OR (endTime BETWEEN $from AND $to) OR ($from BETWEEN startTime AND endTime) OR ($to BETWEEN startTime AND endTime)) ");

    if (r.isNotEmpty) {
      return 0;
    }

    var id = await db
        .update(dbName, event.toMap(), where: "id = ?", whereArgs: [event.id]);

    db.close();

    return id;
  }

  Future<List<Event>> fetchEvents() async {
    var db = await initiateDB();

    List<Map<String, dynamic>> result = await db.query(dbName);
    db.close();

    return result.map((e) => Event.fromMap(e)).toList();
  }
}
