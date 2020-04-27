import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_attendance/Example_detail.dart';

class Example extends StatefulWidget{
  @override
  _ExampleState createState()=>new _ExampleState();
}

class _ExampleState extends State<Example>{

  String _selectedYear = null;
  String _selectedSem=null;
  var selectedDep;
  var _formKey=GlobalKey<FormState>();

  String subCode='';
  String subject='';

  void _addData(){
    Firestore.instance.runTransaction((Transaction transaction)
    async{
      CollectionReference reference=Firestore.instance.collection('DepDetails').document(selectedDep).collection(_selectedYear).document(_selectedSem).collection('courses');
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

                          hint: Text('Department'),
                        ),
                      ],
                    );
                  }
                },
              ),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    DropdownButton(


                      value: _selectedYear,
                      items: _dropDownItem1(),
                      onChanged: (value) {
                        _selectedYear = value;

                        setState(() {

                        });
                      },

                      hint: Text('Year',),
                    ),
                    DropdownButton(


                      value: _selectedSem,
                      items: _dropDownItem2(),
                      onChanged: (value) {
                        _selectedSem = value;

                        setState(() {

                        });
                      },

                      hint: Text('Semester',),
                    ),
                  ],
                ),
              ),



              Padding(
                padding: const EdgeInsets.only(top:10.0,left:10.0),
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
                padding: const EdgeInsets.only(top:10.0),
                child: StreamBuilder(
                  stream: Firestore.instance
                      .collection('DepDetails').document(selectedDep).collection(_selectedYear).document(_selectedSem).collection('courses')
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

List<DropdownMenuItem<String>> _dropDownItem1() {
  List<String>ddl = ["Year 1", "Year 2", "Year 3","Year 4"];
  return ddl.map(
          (value) =>
          DropdownMenuItem(
            value: value,
            child: Text(value),
          )
  ).toList();
}
List<DropdownMenuItem<String>> _dropDownItem2() {
  List<String>ddl = ["Semester 1", "Semester 2"];
  return ddl.map(
          (value) =>
          DropdownMenuItem(
            value: value,
            child: Text(value),
          )
  ).toList();
}

class TaskList extends StatelessWidget {
  TaskList({this.document});

  final List<DocumentSnapshot>document;

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: document.length,
      itemBuilder: (BuildContext context, int i) {
        String subCode = document[i].data['subCode'].toString();
        String subject = document[i].data['subject'].toString();

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
            ],
          ),
        );



      },
    );
  }
}




