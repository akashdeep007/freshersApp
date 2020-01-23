import 'package:flutter/material.dart';
import 'package:hogwarts/screens/home/CustomDrawer.dart';
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
            ),
            drawer: CustomDrawer(),
            body: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      color: Colors.black12,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 150,
                        width: 160,
                        child: Column(
                          children: <Widget>[
                            Text(studentLenght.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 72)),
                            Text("Enrolled",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 36)),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.black12,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 150,
                        width: 160,
                        child: Column(
                          children: <Widget>[
                            Text("59",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 72)),
                            Text("Total",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 36)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: StudentList(),
                )
              ],
            )));
  }
}
