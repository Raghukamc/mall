import 'package:flutter/material.dart';
import 'package:mall/src/HomeScreen.dart';
import 'package:mall/src/Category.dart';
import 'package:mall/src/SubCategory.dart';
import 'package:mall/src/Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
