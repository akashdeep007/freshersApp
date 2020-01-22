import 'package:flutter/material.dart';
import 'package:hogwarts/models/user.dart';
import 'package:hogwarts/screens/autheticate/autheticate.dart';
import 'package:hogwarts/services/auth.dart';
import 'package:provider/provider.dart';
import './home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
