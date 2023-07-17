import 'package:sqflite/sqflite.dart';
import 'package:studentapp/data/transcript/transcript.dart';

class TranscriptDB {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "transcript";
  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'transcript.db';
      _db = await openDatabase(_path, version: _version,
          onCreate: (db, version) async {
        print('creating a new one');
        return await db.execute(
          "CREATE TABLE $_tableName("
          "id INTEGER PRIMARY KEY , "
          "nameSubject STRING, "
          "testOne INTEGER, testTwo INTEGER, "
          "testThree INTEGER, testFour INTEGER) ",
        );
      });
    } catch (e) {
      print(e);
    }
  }

  //insert
  static Future<int?> insert(Transcript? transcript) async {
    print('insert function called');
    return await _db?.insert(_tableName, transcript!.toJson());
  }

  // Map<String, object>
  static Future<List<Map<String, dynamic>>> query() async {
    print('insert function called');
    return await _db!.query(_tableName);
  }

  //show data
  static Future<List<Map<String, dynamic>>> showDataTranscript(
      String sql) async {
    return await _db!.rawQuery(sql);
  }

  //
}
