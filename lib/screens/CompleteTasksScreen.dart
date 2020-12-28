import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_ass/DataBase/DBHelper.dart';
import 'package:sql_ass/model/Task.dart';
import 'package:sql_ass/app_provider.dart';

import 'FirstScreen.dart';

class CompleteTasksScreen extends StatefulWidget {
  @override
  _CompleteTasksScreenState createState() => _CompleteTasksScreenState();
}

class _CompleteTasksScreenState extends State<CompleteTasksScreen> {
  @override
  Widget build(BuildContext context) {
    var db = DBHelper();
    //////
    db.getTaskType(1).then((value) {
      Provider.of<AppProvider>(context, listen: false).setTasks(value);
    });
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<AppProvider>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.tasks.length,
              itemBuilder: (_, int position) {
                bool isComplete = false;
                if (value.tasks[position].isComplete) {
                  isComplete = true;
                } else {
                  isComplete = false;
                }
                return Container(
                  height: 70,
                  child: Center(
                    child: ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          Widget cancelButton = FlatButton(
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          );
                          Widget continueButton = FlatButton(
                            child: Text("Yes"),
                            onPressed: () {
                              db.deleteTask(value.tasks[position].id);
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => MyPage()),
                                  (Route<dynamic> route) => false);
                            },
                          );

                          AlertDialog alert = AlertDialog(
                            title: Text("Delete Task?"),
                            content: Text("Are you want to delete this Task?"),
                            actions: [
                              cancelButton,
                              continueButton,
                            ],
                          );

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                      title: Text(value.tasks[position].taskName),
                      trailing: Checkbox(
                          activeColor: Colors.deepPurpleAccent,
                          value: isComplete,
                          onChanged: (value1) {
                            db.updateTask(UserTask(
                              id: value.tasks[position].id,
                              taskName: value.tasks[position].taskName,
                              isComplete: value1,
                            ));
                            db.getTaskType(1).then((value) {
                              Provider.of<AppProvider>(context, listen: false)
                                  .setTasks(value);
                            });
                          }),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
