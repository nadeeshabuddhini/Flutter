import 'package:flutter/material.dart';
import 'package:student_attendance/AddCourse.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_attendance/EditCourse.dart';

class Course_detail extends StatefulWidget{
  @override
  Course_detailState createState()=>new Course_detailState();
}
class Course_detailState extends State<Course_detail>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      floatingActionButton:new FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(new MaterialPageRoute(
              builder:(BuildContext context)=>new AddCourse())
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
                  .collection("course details")
                  .snapshots(),

              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                if(!snapshot.hasData)
                  return new Container(child: Center(
                    child:CircularProgressIndicator(),
                  ),);
                return new TaskList(document: snapshot.data.documents,);
              },
            ),
          ),
        ],
      ),

    );

  }
}
class TaskList extends StatelessWidget{
  TaskList({this.document});
  final List<DocumentSnapshot>document;
  @override
  Widget build(BuildContext context) {

    return new ListView.builder(
        itemCount: document.length,
        itemBuilder:(BuildContext context,int i){
      String subCode=document[i].data['subCode'].toString();
      String subject=document[i].data['subject'].toString();

      return new Dismissible(
          key: new Key(document[i].documentID),
    onDismissed: (direction){
    Firestore.instance.runTransaction((transaction)async{
    DocumentSnapshot snapshot=
    await transaction.get(document[i].reference);
    await transaction.delete(snapshot.reference);
    }
    );
    Scaffold.of(context).showSnackBar(
    new SnackBar(content: new Text("Data Deleted"),)

    );
    },
        child: Padding(
          padding: const EdgeInsets.only(left:16.0,top: 8.0,right: 16.0,bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                           Text("(",style: new TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                           Text(subCode,style: new TextStyle(fontSize: 18.0,fontWeight:FontWeight.bold,letterSpacing: 1.0),),
                           Text(") - ",style:new TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),

                             new Expanded(
                             child: Padding(
                               padding: const EdgeInsets.only(top:16.0),
                               child: Text(subject,style: new TextStyle(fontSize: 18.0,letterSpacing: 1.0),),
                             ),
                             ),

                        ],
                      ),





                    ],
                  ),
                ),
              ),
              new IconButton(
                icon: Icon(Icons.edit,color: Colors.blue,),
                onPressed: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder:(BuildContext context)=>new EditCourse(
                      subCode:subCode,
                      subject:subject,
                      index: document[i].reference,
                    ),
                  ),
                  );
                },
              ),
            ],
          ),
        ),
      );






        },
    );
  }
}




