import 'package:flutter/material.dart';
import 'package:st_attendance/AddTask.dart';


class student_detail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      floatingActionButton:new FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(new MaterialPageRoute(
              builder:(BuildContext context)=>new AddTask())
          );

        },
    child:Icon(Icons.add),
        backgroundColor:Colors.lightBlueAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: new BottomAppBar(
        elevation: 30.0,
        color: Colors.blue,
        child: ButtonBar(
          children: <Widget>[],
        ),
      ),
      appBar:AppBar(
        title: Text('Student Details'
        ),

      ),
    );

  }
}
