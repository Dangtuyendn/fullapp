import 'package:sqflite/sqflite.dart';
import 'package:studentapp/data/account/account.dart';

class AccountDBHelper {
  static Database? _data;
  static final int _version = 1;
  static final String _tableName = 'account';
  static Future<void> initDb() async {
    if (_data != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'account.db';
      _data = await openDatabase(_path, version: _version,
          onCreate: (db, version) async {
        print('creating a new one');
        return await db.execute(
          "CREATE TABLE $_tableName("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "name STRING, email STRING UNIQUE, "
          "password STRING) ",
        );
      });
    } catch (e) {
      print(e);
    }
  }

//add
  static Future<int?> insert(Account? account) async {
    // return await _data?.insert(_tableName, account!.toJson());
    var res = await _data?.insert(_tableName, account!.toJson());
    return res;
  }

  static Future<List<Map<String, dynamic>>> querydtb() async {
    print('insert function called');
    return await _data!.query(_tableName);
  }

  static Future<List<Map<String, dynamic>>> showDataAcount(String sql) async {
    return await _data!.rawQuery(sql);
  }

  static Future<Account?> getLoginUser(String email, String pass) async {
    var res = await _data!.rawQuery("SELECT * FROM $_tableName WHERE "
        "email = '$email' AND "
        "password = '$pass'");

    if (res.length > 0) {
      return Account.fromJson(res.first);
    }

    return null;
  }
}
