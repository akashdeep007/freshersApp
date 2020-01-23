import 'package:flutter/material.dart';
import 'package:hogwarts/screens/home/CustomDrawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text("This is the Home Page"),
      ),
    );
  }
}
