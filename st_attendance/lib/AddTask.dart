import 'package:flutter/material.dart';

class AddTask extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child:Column(
        children: <Widget>[
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage("images/bg2.jpg"),
              fit: BoxFit.cover),

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text("Add Student",style: new TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                letterSpacing: 2.0,
              ),)
            ],),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: TextField(
               decoration: new InputDecoration(
                 icon: Icon(Icons.dashboard),
                 hintText: "Index No",
                 border: InputBorder.none
               ),
                style: new TextStyle(fontSize: 20.0,
                color:Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: TextField(
                decoration: new InputDecoration(
                    icon: Icon(Icons.account_circle),
                    hintText: "Name",
                    border: InputBorder.none
                ),
                style: new TextStyle(fontSize: 20.0,
                    color:Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: TextField(
                decoration: new InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "Student E-mail",
                    border: InputBorder.none
                ),
                style: new TextStyle(fontSize: 20.0,
                    color:Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: TextField(
                decoration: new InputDecoration(
                    icon: Icon(Icons.list),
                    hintText: "Subject",
                    border: InputBorder.none
                ),
                style: new TextStyle(fontSize: 20.0,
                    color:Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: TextField(
                decoration: new InputDecoration(
                    icon: Icon(Icons.call),
                    hintText: "Phone No",
                    border: InputBorder.none
                ),
                style: new TextStyle(fontSize: 20.0,
                    color:Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.check,size: 40.0,),
                  onPressed: (){},
                ),
                IconButton(
                  icon: Icon(Icons.close,size: 40.0,),
                  onPressed: (){},
                ),
              ],
            ),
          )
        ],

      ),

    );
  }

}