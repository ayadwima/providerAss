import 'package:sqflite/sqflite.dart';
import 'package:sql_ass/model/Task.dart';

class DBHelper {
  Database database;
  static final String dbName = '/sql.db';
  static final String tableName = 'tasksUser';
  static final String columnId = 'id';
  static final String columnName = 'name';
  static final String columnIsComplete = 'iscomplete';

  Future<Database> initDataBase() async {
    if (database == null) {
      return await createDataBase();
    } else {
      return database;
    }
  }

  createDataBase() async {
    try {
      String dbPath = await getDatabasesPath();
      String path = dbPath + dbName;
      Database database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY AUTOINCREMENT , $columnName TEXT, $columnIsComplete INTEGER)');
      });
      return database;
    } catch (e) {
      print(e);
    }
  }

  insertTask(UserTask task) async {
    try {
      database = await initDataBase();
      await database.insert(tableName, task.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<List<UserTask>> getAllTasks() async {
    try {
      database = await initDataBase();
      List<Map> myMap = await database.query(tableName);
      List<UserTask> tasks = myMap.map((e) => UserTask.fromJson(e)).toList();
      return tasks;
    } catch (e) {
      print(e);
    }
  }

  Future<List<UserTask>> getTaskType(int isComplete) async {
    try {
      database = await initDataBase();
      List<Map> maps = await database.query(tableName,
          where: '$columnIsComplete=?', whereArgs: [isComplete]);
      List<UserTask> tasks = maps.map((e) => UserTask.fromJson(e)).toList();
      return tasks;
    } catch (e) {
      print(e);
    }
  }

  updateTask(UserTask task) async {
    try {
      database = await initDataBase();
      database.update(tableName, task.toJson(),
          where: '$columnId=?', whereArgs: [task.id]);
    } catch (e) {}
  }

  deleteTask(int id) async {
    try {
      database = await initDataBase();
      database.delete(tableName, where: '$columnId=?', whereArgs: [id]);
    } catch (e) {}
  }
}
