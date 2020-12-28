import 'package:flutter/material.dart';
import 'package:sql_ass/model/Task.dart';

class AppProvider extends ChangeNotifier {
  List<UserTask> tasks;
  setTasks(tasks) {
    this.tasks = tasks;
    notifyListeners();
  }
}
