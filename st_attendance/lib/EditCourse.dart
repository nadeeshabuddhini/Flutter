import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditCourse extends StatefulWidget{
  EditCourse({this.subCode,this.subject,this.index});
  final String subCode;
  final String subject;
  final index;

  @override
  _EditCourseState createState()=>new _EditCourseState();
}

class _EditCourseState extends State<EditCourse>{

  TextEditingController controllersubCode;
  TextEditingController controllersubject;

  String subCode;
  String subject;



  void editTask(){
    Firestore.instance.runTransaction((Transaction transaction)async{
      DocumentSnapshot snapshot=
      await transaction.get(widget.index);
      await transaction.update(snapshot.reference,{
        "subCode":subCode,
        "subject":subject,

      }
      );
    }
    );
    Navigator.pop(context);
  }
  @override
  void initState(){
    super.initState();

    subCode=widget.subCode;
    subject=widget.subject;


    controllersubCode=new TextEditingController(text:widget.subCode);
    controllersubject=new TextEditingController(text:widget.subject);

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
                    image: AssetImage("images/bg1.jpg"),
                    fit: BoxFit.cover),
              ),


              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Update Course", style: new TextStyle(
                    color: Colors.white,
                    fontWeight:FontWeight.bold,
                    fontSize: 32.0,
                    letterSpacing: 2.0,
                  ),
                  )
                ],
              ),
            ),


                Padding(
                  padding: const EdgeInsets.only(top:40.0),
                  child: TextField(
                    controller: controllersubCode,
                    onChanged: (String str){
                      setState((){
                        subCode=str;
                      });
                    },
                    decoration: new InputDecoration(
                        icon: Icon(Icons.dashboard),
                        hintText: "Subject Code",
                        border: InputBorder.none
                    ),
                    style: new TextStyle(fontSize: 20.0,
                        color: Colors.black),
                  ),
                ),

            Padding(
              padding: const EdgeInsets.only(top:30.0),
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
              padding: const EdgeInsets.all(30.0),
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