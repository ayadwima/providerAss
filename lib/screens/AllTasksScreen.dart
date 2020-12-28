import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_ass/DataBase/DBHelper.dart';
import 'package:sql_ass/model/Task.dart';
import 'package:sql_ass/app_provider.dart';
import 'FirstScreen.dart';

class AllTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var db = DBHelper();
    db.getAllTasks().then((value) {
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
                          Widget cancelBtn = FlatButton(
                            child: Text("NO"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          );
                          Widget continueBtn = FlatButton(
                            child: Text("Yes"),
                            onPressed: () {
                              db.deleteTask(value.tasks[position].id);
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => MyPage()));
                            },
                          );

                          AlertDialog alert = AlertDialog(
                            title: Text("Delete Task"),
                            content: Text("Do you want to delete this Task ?"),
                            actions: [
                              cancelBtn,
                              continueBtn,
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
                            db.getAllTasks().then((value) {
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