import 'package:flutter/material.dart';
import 'package:sql_ass/DataBase/DBHelper.dart';
import 'package:sql_ass/model/Task.dart';
import 'package:sql_ass/screens/FirstScreen.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final db = DBHelper();

  @override
  Widget build(BuildContext context) {
    var c = TextEditingController();
    String newTaskTitle = "task 1";
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 270),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 25),
              ),
              TextField(
                controller: c,
                autofocus: true,
                cursorColor: Colors.deepPurpleAccent,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  newTaskTitle = c.text;
                },
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                color: Colors.deepPurpleAccent,
                onPressed: () {
                  db.insertTask(
                      UserTask(taskName: newTaskTitle, isComplete: false));
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyPage()));                         
                },
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
