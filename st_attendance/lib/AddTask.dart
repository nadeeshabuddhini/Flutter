import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_attendance/student_detail.dart';

class AddTask extends StatelessWidget{
  String indexno='';
  String name='';
  String email='';
  String subject='';
  String phoneno='';
  
  void _addData(){
    Firestore.instance.runTransaction((Transaction transaction)
    async{
      CollectionReference reference=Firestore.instance.collection('task');
      await reference.add(
        {
         "Indexno":indexno,
         "Name":name,
          "E-mail":email,
          "Subject":subject,
          "PhoneNo":phoneno,

        }
      );
    }
    );
   Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:new SingleChildScrollView(
        child:Column(
          children: <Widget>[
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg2.jpg"),
                    fit: BoxFit.cover),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Add Student", style: new TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (String str){
                  setState((){
                    indexno=str;
                  });
                },
                decoration: new InputDecoration(
                    icon: Icon(Icons.dashboard),
                    hintText: "Index No",
                    border: InputBorder.none
                ),
                style: new TextStyle(fontSize: 20.0,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (String str){
                  setState((){
                    name=str;
                  });
                },
                decoration: new InputDecoration(
                    icon: Icon(Icons.account_circle),
                    hintText: "Name",
                    border: InputBorder.none
                ),
                style: new TextStyle(fontSize: 20.0,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (String str){
                  setState((){
                    email=str;
                  });
                },
                decoration: new InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "Student E-mail",
                    border: InputBorder.none
                ),
                style: new TextStyle(fontSize: 20.0,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (String str){
                  setState((){
                    subject=str;
                  });
                },
                decoration: new InputDecoration(
                    icon: Icon(Icons.list),
                    hintText: "Subject",
                    border: InputBorder.none
                ),
                style: new TextStyle(fontSize: 20.0,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (String str){
                  setState((){
                    phoneno=str;
                  });
                },
                decoration: new InputDecoration(
                    icon: Icon(Icons.call),
                    hintText: "Phone No",
                    border: InputBorder.none
                ),
                style: new TextStyle(fontSize: 20.0,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.check, size: 40.0,),
                    onPressed: () {
                      _addData();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.close, size: 40.0,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),


          ],

        ),
      ),
    );
  }//build widget
}//stateless