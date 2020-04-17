import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_attendance/Example_detail.dart';

class Example extends StatefulWidget{
  @override
  _ExampleState createState()=>new _ExampleState();
}

class _ExampleState extends State<Example>{
  var selectedDep;
  var _formKey=GlobalKey<FormState>();

  String subCode='';
  String subject='';

  void _addData(){
    Firestore.instance.runTransaction((Transaction transaction)
    async{
      CollectionReference reference=Firestore.instance.collection('department');
        await reference.add(
            {
              
              "subCode":subCode,
              "subject":subject,

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
      body:Form(
        key: _formKey,
        child:new SingleChildScrollView(
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
                    Text("Add Course", style: new TextStyle(
                      color: Colors.white,
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                    )
                  ],
                ),
              ),

            SizedBox(height: 40.0,),
              StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection("department").snapshots(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    Text("Loading");
                  }else{
                    List<DropdownMenuItem>Department=[];
                    for(int i=0;i<snapshot.data.documents.length;i++){
                      DocumentSnapshot snap=snapshot.data.documents[i];
                      Department.add(
                        DropdownMenuItem(
                          child: Text(
                            snap.documentID,
                            style: TextStyle(color: Colors.black),
                          ),
                          value:"${snap.documentID}",
                        )
                      );
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.list),
                        SizedBox(width: 50.0,),
                        DropdownButton(
                          items: Department,
                          value: selectedDep,
                        onChanged: (value){
                            selectedDep=value;
                            setState(() {

                            });
                        },

                          hint: Text('Select the department'),
                        ),
                      ],
                    );
                  }
                },
              ),



              Padding(
                padding: const EdgeInsets.only(top:40.0,left:10.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return 'Please enter Subject Code';
                    }
                  },
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
                padding: const EdgeInsets.only(left:10.0,top:30.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return 'Please enter Subject';
                    }
                  },
                  onChanged: (String str){
                    setState((){
                      subject=str;
                    });
                  },
                  decoration: new InputDecoration(
                      icon: Icon(Icons.subject),
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
                      onPressed: () {
                        setState(() {
                          if(_formKey.currentState.validate()){
                            _addData();
                          }
                        });
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
      ),
    );
  }//build widget
}//stateless