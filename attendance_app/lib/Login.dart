import 'package:flutter/material.dart';
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
        title: Text('Sign in'),
    ),
    body: Container(
      padding: EdgeInsets.only(left:30.0,top: 10.0),
    child: Column(
      crossAxisAlignment:CrossAxisAlignment.center,
    children: <Widget>[
    Text(
    'Welcome to',
    style: TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 10.0,),
      Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.black,
                    style:BorderStyle.solid,
                width: 5.0
              ),
              image: DecorationImage(image: AssetImage('images/logo.png'),
              )
              ),
          ),
        ],
      ),
    SizedBox(height: 10.0,),
      Column(
        children: <Widget>[
          Text(
            "STUDENT ATTENDANCE SYSTEM",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,

          ),
          )
        ],
      ),
     SizedBox(height: 10.0),
      Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0,right: 15.0),
            child: Material(
              elevation: 5.0,

              borderRadius: BorderRadius.circular(25),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                 prefixIcon: Icon(
                   Icons.email,
                   color: Colors.grey,
                   size: 30.0,
                 ),
                  contentPadding:
                    EdgeInsets.only(left: 15,top:15,bottom: 10),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.grey
                  )
                ),
              ),
            ),
          )
        ],
      ),
    SizedBox(height: 10.0),
    Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10.0,right: 15.0),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(25),
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Colors.grey,
                    size: 30.0,
                  ),
                  contentPadding:
                  EdgeInsets.only(left: 15,top:15,bottom: 10),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
              obscureText: true,
            ),
          ),
        )
      ],
    ),
    SizedBox(height: 10.0,),
    Container(
      child: Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Forgot Password?",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    ),
    SizedBox(height: 10.0,),
    RaisedButton(
      onPressed: (){},
      color: Colors.blue,
      child: Text('LOGIN'),
    ),
    ],
    )


    ),
    );
  }
}