import 'package:flutter/material.dart';
import 'package:sql_ass/app_provider.dart';
import 'package:sql_ass/screens/SplashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) {
      return appProvider();
    },
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  ));
}
