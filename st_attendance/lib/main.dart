import 'package:flutter/material.dart';
import 'package:st_attendance/Login.dart';
import 'package:st_attendance/Home.dart';


void main()=> runApp(new MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'student attendance',
      routes: <String,WidgetBuilder>{
        '/Login': (BuildContext context) => new Login(),
        '/Home': (BuildContext context) => new  Home(),
      },
      theme: new ThemeData(
        primarySwatch:Colors.blue,
      ),
      home: new Login(),
    );
  }

}
