import 'package:sql_ass/DataBase/DataBaseHelper.dart';

class UserTask {
  int id;
  String taskName;
  bool isComplete;
  UserTask({this.id, this.taskName, this.isComplete});
  toJson() {
    return {
      DBHelper.columnId: this.id,
      DBHelper.columnName: this.taskName,
      DBHelper.columnIsComplete: this.isComplete ? 1 : 0
    };
  }

  UserTask.fromJson(Map map) {
    this.taskName = map[DBHelper.columnName];
    this.id = map[DBHelper.columnId];
    this.isComplete = map[DBHelper.columnIsComplete] == 1 ? true : false;
  }
}
