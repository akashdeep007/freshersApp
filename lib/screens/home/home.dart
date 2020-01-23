import 'package:flutter/material.dart';
import 'package:hogwarts/screens/home/StudentsDashboard.dart';
import 'package:hogwarts/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: <Widget>[],
    );
  }
}
