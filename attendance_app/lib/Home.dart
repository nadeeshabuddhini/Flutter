import 'package:flutter/material.dart';
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar:AppBar(
        title: Text('Home'
        ),

      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          new Container(
            child: new Card(
              elevation: 10.0,
              child: new Column(
                children: <Widget>[
                 new Image.asset("images/logo.png",
                 height: 100.0,
                 width: 100.0,
                 fit: BoxFit.cover,),
                  new SizedBox(height:5.0,),
                  new Text("Student",
                  style:TextStyle(
                    fontSize:20.0,
                    color:Colors.black
                  ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}


