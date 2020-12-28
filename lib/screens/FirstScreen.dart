import 'package:flutter/material.dart';
import 'package:sql_ass/DataBase/DBHelper.dart';
import 'package:sql_ass/screens/AllTasksScreen.dart';
import 'package:sql_ass/screens/CompleteTasksScreen.dart';
import 'package:sql_ass/screens/InCompleteTasksScreen.dart';
import 'package:sql_ass/AddTask.dart';

class MyPage extends StatelessWidget {
  var db = DBHelper();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
              drawer: Drawer(),
            appBar: AppBar(
              backgroundColor: Colors.deepPurpleAccent,
              title: Text('My App'),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'All Tasks',
                  ),
                  Tab(
                    text: 'complete Tasks',
                  ),
                  Tab(
                    text: 'incomplete  Tasks',
                  )
                ],
                isScrollable: true,
              ),
            ),
              floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.deepPurpleAccent,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddTaskScreen()),
                );
              },
              child: Icon(Icons.add),
            ),
            body: TabBarView(
              children: [AllTasksScreen(), CompleteTasksScreen(), InCompleteTasksScreen()],
            )));
  }
}
