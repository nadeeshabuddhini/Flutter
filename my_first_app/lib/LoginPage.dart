import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  String _email,_password,_username;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Sign in'),
      ),

      body: Form(
        key: _formkey,
        child:Column(
          children: <Widget>[
            TextFormField(
              validator: (input){
                if(input.isEmpty){
                  return'Please enter your name';
                }
              },
              onSaved: (input)=>_username=input,
              decoration: InputDecoration(
                  labelText:'User Name'

              ),
            ),
            TextFormField(
              validator: (input){
                if(input.isEmpty){
                  return'Please type an email';
                }
              },
              onSaved: (input)=>_email=input,
              decoration: InputDecoration(
                  labelText:'Email'

              ),
            ),
            TextFormField(
              validator: (input){
                if(input.length<6){
                  return'your password needs to be atleast 6 characters';
                }
              },
              onSaved: (input)=>_password=input,
              decoration: InputDecoration(
                  labelText: 'Password'
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: (){},
              color: Colors.green,
              child: Text('Sign in'),
            )
          ],
        ),
      ),
    );
  }
  void signIn(){
    final formState=_formkey.currentState;
    if(formState.validate()){

    }
  }
}