import 'package:flutter/material.dart';
import 'package:hogwarts/services/auth.dart';
import 'package:hogwarts/screens/home/StudentsDashboard.dart';
import 'package:hogwarts/screens/home/home.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Drawer(
      child: Column(
        children: <Widget>[
          Card(
            child: Column(children: <Widget>[
              Icon(Icons.person),
            ]),
          ),
          FlatButton(
            child: Text("HomePage"),
            onPressed: () {
              Navigator.push(
                  context, new MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          FlatButton(
            child: Text("StudentDashboard"),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => StudentDashboard()));
            },
          ),
          FlatButton(
            child: Text("Logout"),
            onPressed: () {
              _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
