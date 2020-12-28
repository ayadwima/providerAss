import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_ass/DataBase/DataBaseHelper.dart';
import 'package:sql_ass/app_provider.dart';
import 'package:sql_ass/screens/FirstScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var db = DBHelper();
    db.getAllTasks().then((value) {
      Provider.of<appProvider>(context, listen: false).setTasks(value);
      Timer(Duration(seconds: 2), () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return MyPage();
        }));
      });
    });
    return Scaffold(
      body: Center(
          child: Container(
              height: 150,
              width: 150,
              child: Image.asset('images/splash.png'))),
    );
  }
}
