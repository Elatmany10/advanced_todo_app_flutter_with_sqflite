import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:advaced_todo_sqflite/app/core/values/theme.dart';
import 'package:advaced_todo_sqflite/app/core/values/theme_services.dart';
import 'package:advaced_todo_sqflite/app/data/local/db/db_helper.dart';
import 'package:advaced_todo_sqflite/app/modules/home/views/home_page.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DBHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeServices().theme,
        theme: Themes.light,
        darkTheme: Themes.dark,
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
