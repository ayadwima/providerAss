import 'package:flutter/material.dart';
import 'package:sql_ass/model/Task.dart';

class appProvider extends ChangeNotifier {
  List<UserTask> tasks;
  setTasks(tasks) {
    this.tasks = tasks;
    notifyListeners();
  }
}
