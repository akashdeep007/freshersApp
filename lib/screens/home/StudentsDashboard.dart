import 'package:flutter/material.dart';
import 'package:hogwarts/services/auth.dart';
import 'package:hogwarts/services/database.dart';
import 'package:hogwarts/screens/home/StudentList.dart';
import 'package:provider/provider.dart';
import 'package:hogwarts/models/Student.dart';

class StudentDashboard extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Student>>.value(
      value: DatabaseService().students,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hogwarts"),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: StudentList(),
      ),
    );
  }
}
