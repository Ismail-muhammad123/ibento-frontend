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
    String path = join(appDocDir.path, 'Local_bookings_record.db');
    var db = await databaseFactory.openDatabase(path);

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $dbName (
        id INT PRIMARY KEY,
        eventName TEXT,
        startTime INT,
        endTime INT,
        name TEXT,
        phone TEXT,
        email TEXT NULL,
        address TEXT NULL,
        amountPaid INT,
        balance INT
    )
    ''');

    return db;
  }

  insert(Event event) async {
    var db = await initiateDB();

    Map<String, dynamic> event_map = event.toMap();

    int from = event_map['startTime'];
    int to = event_map['endTime'];

    List<Map> r = await db.rawQuery(
        "SELECT eventName FROM $dbName WHERE $from >= startTime OR $to <= endTime");

    if (r.length > 0) {
      return 0;
    }

    var id = await db.insert(dbName, event.toMap());

    print(id);

    db.close();

    return id;
  }

  fetchEvents() async {
    var db = await initiateDB();

    List<Map<String, dynamic>> result = await db.query(dbName);

    print(result);

    db.close();

    return result.map((e) => Event.fromMap(e)).toList();
  }
}
