import 'package:flutter/material.dart';
import 'package:hogwarts/models/user.dart';
import 'package:hogwarts/screens/autheticate/sign_in.dart';
import 'package:provider/provider.dart';
import './home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return SignIn();
    } else {
      return Home();
    }
  }
}
