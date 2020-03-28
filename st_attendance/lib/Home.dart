import 'package:flutter/material.dart';
import 'package:st_attendance/student_detail.dart';
import 'package:st_attendance/Course_detail.dart';
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar:AppBar(
        title: Text('Admin Home'
        ),

      ),

      body: new GridView.count(

        crossAxisCount: 2,
        children: <Widget>[
          new GestureDetector(
              child: new Card(
                elevation: 10.0,
                child: new Column(
                  children: <Widget>[
                    new Image.asset("images/student2.jpg",
                      height: 140.0,
                      width: 140.0,
                      fit: BoxFit.cover,),
                    new SizedBox(height:5.0,
                    ),
                    new Text("Student Details",
                      style:TextStyle(
                          fontSize:18.0,
                          color:Colors.black
                      ),
                    )
                  ],
                ),
              ),
              onTap:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>student_detail())
                );
              }
          ),

            new GestureDetector(
              child: new Card(
                elevation: 10.0,
                child: new Column(
                  children: <Widget>[
                    new Image.asset("images/st_attend.jpg",
                      height: 140.0,
                      width: 140.0,
                      fit: BoxFit.cover,),
                    new SizedBox(height:5.0,
                    ),
                    new Text("Student Attendance",
                      style:TextStyle(
                          fontSize:18.0,
                          color:Colors.black
                      ),
                    )
                  ],
                ),
              ),

              onTap:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>student_detail())
                );
              }
          ),

          new GestureDetector(
            child: new Card(
              elevation: 10.0,
              child: new Column(
                children: <Widget>[
                  new Image.asset("images/course.png",
                    height: 140.0,
                    width: 140.0,
                    fit: BoxFit.cover,),
                  new SizedBox(height:5.0,
                  ),
                  new Text("Course Details ",
                    style:TextStyle(
                        fontSize:18.0,
                        color:Colors.black
                    ),
                  )
                ],
              ),
            ),
              onTap:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>Course_detail())
                );
              }
          ),
          new GestureDetector(
            child: new Card(
              elevation: 10.0,
              child: new Column(
                children: <Widget>[
                  new Image.asset("images/note2.png",
                    height: 140.0,
                    width: 140.0,
                    fit: BoxFit.cover,),
                  new SizedBox(height:5.0,
                  ),
                  new Text("Course Attendance",
                    style:TextStyle(
                        fontSize:18.0,
                        color:Colors.black
                    ),
                  )
                ],
              ),
            ),
              onTap:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>student_detail())
                );
              }
          ),
          new GestureDetector(
            child: new Card(
              elevation: 10.0,
              child: new Column(
                children: <Widget>[
                  new Image.asset("images/lec2.png",
                    height: 140.0,
                    width: 140.0,
                    fit: BoxFit.cover,),
                  new SizedBox(height:5.0,
                  ),
                  new Text("Lecturer Details",
                    style:TextStyle(
                        fontSize:18.0,
                        color:Colors.black
                    ),
                  )
                ],
              ),
            ),
              onTap:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>student_detail())
                );
              }
          ),
          new GestureDetector(
            child: new Card(
              elevation: 10.0,
              child: new Column(
                children: <Widget>[
                  new Image.asset("images/dash.png",
                    height: 140.0,
                    width: 140.0,
                    fit: BoxFit.cover,),
                  new SizedBox(height:5.0,
                  ),
                  new Text("Student Dashboard",
                    style:TextStyle(
                        fontSize:18.0,
                        color:Colors.black
                    ),
                  )
                ],
              ),
            ),
              onTap:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>student_detail())
                );
              }
          ),

        ],
      ),
    );
  }

}

