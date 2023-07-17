import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:studentapp/controller/init_controller.dart' as di;
import 'package:studentapp/data/account/account_db.dart';
import 'package:studentapp/data/schedule/db_helper.dart';
import 'package:studentapp/data/subject/subject_db.dart';
import 'package:studentapp/data/transcript/transcript_db.dart';
import 'package:studentapp/screen/account/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await AccountDBHelper.initDb();
  await SubjectDB.initDb();
  await TranscriptDB.initDb();
  await di.init();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MainApp(),
      home: LoginScreen(),
    );
  }
}
