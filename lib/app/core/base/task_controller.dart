import 'package:advaced_todo_sqflite/app/core/model/task.dart';
import 'package:advaced_todo_sqflite/app/data/local/db/db_helper.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((e) => Task.fromJson(e)).toList());
  }

  void delete(Task _) {
    DBHelper.delete(_);
    getTasks();
  }

  void markTaskCompleted(int id) async {
    await DBHelper.update(id);
    getTasks();
  }
}
