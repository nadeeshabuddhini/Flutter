import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  List<Container>AdminHome=new List();
  var character=[
    {"name":"Student","picture":"logo.png"},
    {"name":"Student","picture":"logo.png"},
    {"name":"Student","picture":"logo.png"},
    {"name":"Student","picture":"logo.png"},
    {"name":"Student","picture":"logo.png"},
  ];
  _bulletlist()async{
    for(var i=0; i<character.length; i++){
      final characters=character[i];
      final String picture=characters["picture"];
     AdminHome.add(
       new Container(
         padding: new EdgeInsets.all(10.0),
         child: new Card(child: new Column(
           children: <Widget>[
             new Image.asset("images/$picture",fit: BoxFit.cover,),
             new Text(characters['name'],style: new TextStyle(fontSize: 18.0),)
           ],
         ),),
       )
     );


    }
  }
   


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Text('Home'
        ),
      ),
      body: new GridView.count(
          crossAxisCount: 2,
      children: AdminHome,
      ),
    );
  }

}