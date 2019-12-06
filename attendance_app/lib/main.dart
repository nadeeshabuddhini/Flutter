import 'package:flutter/material.dart';
import 'package:attendance_app/Login.dart';

void main()=> runApp(new MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'student attendance',
      theme: new ThemeData(
        primarySwatch:Colors.blue,
      ),
      home: new Login(),
    );
  }

}
