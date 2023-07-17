import 'package:sqflite/sqflite.dart';
import 'package:studentapp/data/register/register.dart';
class DBRegister {
  static Database? _dba;
  static final int _version = 1;
  static final String _tableName = "registers";
  static Future<void> initDb() async {
    if (_dba != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'registers.db';
      _dba = await openDatabase(_path, version: _version,
          onCreate: (db, version) async {
        print('creating a new one');
        return await db.execute(
          "CREATE TABLE $_tableName("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "name STRING, email STRING, "
          "password STRING) ",
        );
      });
    } catch (e) {
      print(e);
    }
  }

static Future<List<Map<String, dynamic>>> querydb() async {
    print('insert function called');
    return await _dba!.query(_tableName);
  }


  static Future<int?> insert(Register? register) async{
    print('insert function called');
    return await _dba?.insert(_tableName, register!.toJson());
  }

  }