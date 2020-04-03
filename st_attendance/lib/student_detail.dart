import 'package:flutter/material.dart';
import 'package:student_attendance/AddTask.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_attendance/EditTask.dart';

class student_detail extends StatefulWidget{
  @override
  _student_detailState createState()=>new _student_detailState();
}
class _student_detailState extends State<student_detail>{
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
      body: new Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: StreamBuilder(
              stream: Firestore.instance
              .collection("task")
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
          String indexno=document[i].data['indexno'].toString();
          String name=document[i].data['name'].toString();
          String email=document[i].data['email'].toString();
          String subject=document[i].data['subject'].toString();
          String phoneno=document[i].data['phoneno'].toString();

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
                              Padding(
                                padding: const EdgeInsets.only(bottom:8.0),
                                child: Text(indexno,style: new TextStyle(fontSize: 18.0,fontWeight:FontWeight.bold,letterSpacing: 1.0),),
                              ),
                              new Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right:16.0),
                                    child: Icon(Icons.account_circle,color: Colors.blue,),
                                  ),
                                  Text(name,style: new TextStyle(fontSize: 18.0,letterSpacing: 1.0),),
                                ],
                              ),

                              new Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right:16.0),
                                    child: Icon(Icons.email,color: Colors.blue,),
                                  ),
                                  new Expanded(child: Text(email,style: new TextStyle(fontSize: 18.0,letterSpacing: 1.0),)),
                                ],

                              ),

                              new Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right:16.0),
                                    child: Icon(Icons.list,color: Colors.blue,),
                                  ),
                                  new Expanded(child:Text(subject,style: new TextStyle(fontSize: 18.0,letterSpacing: 1.0),)),
                                ],
                              ),

                              new Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right:16.0),
                                    child: Icon(Icons.call,color: Colors.blue,),
                                  ),

                                  Text(phoneno,style: new TextStyle(fontSize: 18.0,letterSpacing: 1.0),),
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
                             builder:(BuildContext context)=>new EditTask(
                               indexno:indexno,
                               name:name,
                               email:email,
                               subject:subject,
                               phoneno:phoneno,
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