import 'package:flutter/material.dart';
import 'package:reconnect/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Tile-Bar"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: RaisedButton(
          child: Text("SignIn anon"),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if (result == null) {
              print("error sign in ");
            }
            else {
              print("sign in successful");
              print(result);
            }
          },
        ),
      ),
    );
  }
}
