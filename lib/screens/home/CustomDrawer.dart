import 'package:flutter/material.dart';
import 'package:hogwarts/models/user.dart';
import 'package:hogwarts/services/auth.dart';
import 'package:hogwarts/screens/home/StudentsDashboard.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
