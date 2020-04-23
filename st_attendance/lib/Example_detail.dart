import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_attendance/Example.dart';

class Example_detail extends StatefulWidget{
  @override
  Course_detailState createState()=>new Course_detailState();
}
class Course_detailState extends State<Example_detail>{
  var selectedDep;
  String _selectedYear=null;
  String _selectedSem=null;

  String subCode='';
  String subject='';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        floatingActionButton:new FloatingActionButton(
        onPressed: (){
      Navigator.of(context).push(new MaterialPageRoute(
          builder:(BuildContext context)=>new Example())
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
    title: Text('Course Details'
    ),
    ),
      body: new Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: StreamBuilder(
              stream: Firestore.instance
                  .collection('DepDetails').document(selectedDep).collection(_selectedYear).document(_selectedSem).collection('courses')
                  .snapshots(),

              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  print(snapshot.data);

                  return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    padding: EdgeInsets.all(5.0),
                    itemBuilder: (BuildContext context,int i){
                     DocumentSnapshot item=snapshot.data.documents[i];
                     print(item['subCode']);
                     print(item['subject']);

                    },
                  );

                }

              }
            ),
          ),
        ],
      ),
    );
  }
  }




