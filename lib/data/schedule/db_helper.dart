import 'package:sqflite/sqflite.dart';
import 'package:studentapp/data/schedule/schedule.dart';
class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "schedule";
  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'schedule.db';
      _db = await openDatabase(_path, version: _version,
          onCreate: (db, version) async {
        print('creating a new one');
        return await db.execute(
          "CREATE TABLE $_tableName("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "title STRING, note TEXT, date STRING, "
          "startTime STRING, endTime STRING, "
          "reMind INTEGER, repeat STRING, "
          "color INTEGER, "
          "isCompleted INTEGER)",
        );
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int?> insert(Schedule? newSchedule) async {
    print('insert function called');
    return await _db?.insert(_tableName, newSchedule!.toJson());
  }

  static Future<int?> updateSchedule({Schedule? newSchedule}) async {
    final result = await _db?.update(_tableName, newSchedule!.toJson(),
        where: 'id=?', whereArgs: [newSchedule.id]);
    return result;
  }

  static update(int id) async {
    return await _db!.rawUpdate('''
UPDATE schedule
SET isCompleted =?
WHERE id=?
''', [1, id]);
  }

  static deleteSchedule(Schedule newSchedule) async {
    return await _db!
        .delete(_tableName, where: 'id=?', whereArgs: [newSchedule.id]);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print('insert function called');
    return await _db!.query(_tableName);
  }
}
