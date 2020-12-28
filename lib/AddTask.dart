import 'package:flutter/material.dart';
import 'package:sql_ass/DataBase/DataBaseHelper.dart';
import 'package:sql_ass/model/Task.dart';
import 'package:sql_ass/screens/FirstScreen.dart';

class ModalSheet extends StatefulWidget {
  @override
  _ModalSheetState createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  final db = DBHelper();

  @override
  Widget build(BuildContext context) {
    var c = TextEditingController();
    String newTaskTitle = "task 1";
    return Container(
      color: Color(0xFF767676),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 22),
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
                  height: 20,
                ),
                FlatButton(
                  color: Colors.deepPurpleAccent,
                  onPressed: () {
                    db.insertTask(
                        UserTask(taskName: newTaskTitle, isComplete: false));
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MyPage()),
                            (Route<dynamic> route) => false);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
