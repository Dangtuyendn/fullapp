import 'package:sqflite/sqflite.dart';
import 'package:studentapp/data/subject/subject.dart';

class SubjectDB {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "subjects";
  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'subjects.db';
      _db = await openDatabase(_path, version: _version,
          onCreate: (db, version) async {
        print('creating a new one');
        return await db.execute(
          "CREATE TABLE $_tableName("
          "id INTEGER PRIMARY KEY , "
          "nameSubject STRING, "
          "teacher STRING, room STRING, "
          "day STRING, period INTEGER) ",
        );
      });
    } catch (e) {
      print(e);
    }
  }

  //insert
  static Future<int?> insert(Subject? subject) async {
    print('insert function called');
    return await _db?.insert(_tableName, subject!.toJson());
  }

  //delete
  static deleteSubjectDB(Subject subject) async {
    return await _db!
        .delete(_tableName, where: 'id=?', whereArgs: [subject.id]);
  }

  //update
   update(String table,Map<String,dynamic> value,String? myWhere )async{
    int reponse=await _db!.update(table, value,where: myWhere);
    return reponse;
   }


  static Future<int?> updateUser(Subject? subject) async {
    var res = await _db?.update(_tableName, subject!.toJson(),
        where: 'id = ?', whereArgs: [subject.id]);
    return res;
  }

// Map<String, object>
  static Future<List<Map<String, dynamic>>> query() async {
    print('insert function called');
    return await _db!.query(_tableName);
  }

  //show data
  static Future<List<Map<String, dynamic>>> showDataSubject(String sql) async {
    return await _db!.rawQuery(sql);
  }
}
