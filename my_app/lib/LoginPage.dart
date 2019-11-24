import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  String _email,_password;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text('Sign in'),
      ),
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
            SizedBox(height: 20.0,),
                 TextFormField(
                   validator: (input){
                   if(input.length<6){
                    return'your password needs to be atleast 6 characters';
                      }
                      },
                      onSaved: (input)=>_password=input,
                       decoration: InputDecoration(
                           labelText: "Password"
                       ),
                         obscureText: true,
                 ),
             SizedBox(height: 20.0,),
             Container(
               child: Row(
                 mainAxisAlignment:MainAxisAlignment.end,
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
            SizedBox(height: 20.0,),
            RaisedButton(
              onPressed: (){},
              color: Colors.green,
              child: Text('LOGIN'),
            ),
            SizedBox(height: 10.0,),
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?",style:TextStyle(fontSize:16.0),),
                    SizedBox(width: 10.0,),
                    Text("SIGN UP",style:TextStyle(color: Theme.of(context).primaryColor,fontSize: 16.0))
                  ],
                ),
              ),
            )

      ],
        ),
        ),

      );
  }

}