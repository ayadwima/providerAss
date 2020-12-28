import 'package:flutter/material.dart';
import 'package:sql_ass/DataBase/DataBaseHelper.dart';
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
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.deepPurpleAccent,
              onPressed: () {
                showModalBottomSheet(
                 context: context,
                   builder: (context) => ModalSheet(),
              elevation: 8.0);
              },
              child: Icon(Icons.add),
            ),
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
            body: TabBarView(
              children: [AllTasksScreen(), CompleteTasksScreen(), InCompleteTasksScreen()],
            )));
  }
}
