import 'package:flutter/material.dart';
import 'package:hogwarts/screens/autheticate/LoginDrawer.dart';
import 'package:hogwarts/services/auth.dart';
import 'package:hogwarts/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name = '';
  String email = '';
  String password = '';
  String interests = '';
  String error = '';

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.amber[50],
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.amber,
              title: Text("Register"),
            ),
            drawer: LoginDrawer(),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'Enter your Name' : null,
                      decoration: InputDecoration(labelText: 'Name'),
                      onChanged: (val) {
                        name = val;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                      decoration: InputDecoration(labelText: 'Email'),
                      onChanged: (val) {
                        email = val;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.length < 6 ? 'Enter an Password 6+ chars' : null,
                      decoration: InputDecoration(labelText: 'Password'),
                      onChanged: (val) {
                        password = val;
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'Enter your Interests' : null,
                      decoration: InputDecoration(labelText: 'Interests'),
                      onChanged: (val) {
                        interests = val;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      child: Text("Register"),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result =
                              await _auth.registerwithEmailandPassword(
                                  name, email, password, interests);
                          if (result == null) {
                            setState(() {
                              error = "Please enter valid email";
                              loading = false;
                            });
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
