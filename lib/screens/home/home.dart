import 'package:flutter/material.dart';
import 'package:hogwarts/screens/home/CustomDrawer.dart';
import 'package:hogwarts/screens/home/StudentsDashboard.dart';
import 'package:hogwarts/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      drawer: CustomDrawer(),
    );
  }
}
