import 'package:flutter/material.dart';
import 'package:hogwarts/screens/autheticate/register.dart';
import 'package:hogwarts/screens/autheticate/sign_in.dart';
import 'package:hogwarts/services/auth.dart';

class LoginDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text("SignIn"),
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => SignIn()));
            },
          ),
          FlatButton(
            child: Text("Register"),
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Register()));
            },
          ),
          FlatButton(
            child: Text("Anonymous SignIn"),
            onPressed: () {
              _auth.signInAnon();
            },
          ),
        ],
      ),
    );
  }
}
