import 'package:flutter/material.dart';
import 'package:hogwarts/models/user.dart';
import 'package:hogwarts/screens/home/Dashboard/DashboardHome.dart';
import 'package:hogwarts/services/auth.dart';
import 'package:hogwarts/services/database.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          return Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.person_pin,
                          size: 64,
                        ),
                        Text(userData == null ? "null" : userData.name),
                      ],
                    ),
                  ),
                ),
                FlatButton(
                  child: Text("StudentDashboard"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => DashboardHome()));
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
        });
  }
}
