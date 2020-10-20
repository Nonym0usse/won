import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  _login() {
    print("----- LOGIN -----");
  }

  _signup() {
    print("----- SIGNUP -----");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Image.asset("assets/won.png"),
              RaisedButton(
                onPressed: () {
                  _login();
                },
                child: Text("CONNEXION"),
              ),
              RaisedButton(
                onPressed: () {
                  _signup();
                },
                child: Text("INSCRIPTION"),
              )
            ],
          ),
        ));
  }
}
