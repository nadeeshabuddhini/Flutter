import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40.0, right: 10.0, left:10.0, bottom:5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Welcome to',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40.0,),
          Text(
            "STUDENT ATTENDANCE SYSTEM",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0,),
          buildTextField("Email"),
          SizedBox(height: 20.0,),
          buildTextField("Password"),
        ],
      ),
      ),
    );
  }
  Widget buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: hintText == "Email" ? Icon(Icons.email) : Icon(
              Icons.lock),
      ),
    );
  }
  }


