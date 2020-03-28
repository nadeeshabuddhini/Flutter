import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_attendance/student_detail.dart';

class EditTask extends StatefulWidget{
  EditTask({this.indexno,this.name,this.email,this.subject,this.phoneno,this.index});
     final String indexno;
     final String name;
     final String email;
     final String subject;
     final String phoneno;
     final index;

  @override
  _EditTaskState createState()=>new _EditTaskState();
}

class _EditTaskState extends State<EditTask>{

  TextEditingController controllerindexno;
  TextEditingController controllername;
  TextEditingController controlleremail;
  TextEditingController controllersubject;
  TextEditingController controllerphoneno;


  String indexno;
  String name;
  String email;
  String subject;
  String phoneno;


void editTask(){
  Firestore.instance.runTransaction((Transaction transaction)async{
    DocumentSnapshot snapshot=
        await transaction.get(widget.index);
        await transaction.update(snapshot.reference,{
          "indexno":indexno,
          "name":name,
          "email":email,
          "subject":subject,
           "phoneno":phoneno,
        }
        );
  }
  );
  Navigator.pop(context);
}
  @override
  void initState(){
    super.initState();

    controllerindexno=new TextEditingController(text:widget.indexno);
    controllername=new TextEditingController(text:widget.name);
    controlleremail=new TextEditingController(text:widget.email);
    controllersubject=new TextEditingController(text:widget.subject);
    controllerphoneno=new TextEditingController(text:widget.phoneno);

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
                Text("Update Data", style: new TextStyle(
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
                controller: controllerindexno,
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
                controller: controllername,
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
                controller: controlleremail,
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
                controller: controllersubject,
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
                controller: controllerphoneno,
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
                    onPressed: ()  {
                      editTask();
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