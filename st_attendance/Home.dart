import 'package:flutter/material.dart';
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.white70,
      appBar:AppBar(
        title: Text('Admin Home'
        ),

      ),

      body: new Container(

      child:new GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.only(top: 20.0),
        children: <Widget>[
           new Container(
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
          ),
          new Container(
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
          ),
          new Container(
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
          ),
          new Container(
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
          ),
          new Container(
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
          ),
          new Container(
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
          ),

        ],
      ),
      ),
    );
  }

}


