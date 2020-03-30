import 'package:flutter/material.dart';
import 'package:reconnect/screens/authenticate/register.dart';
import 'package:reconnect/services/auth.dart';
import 'package:reconnect/shared/constants.dart';
import 'package:reconnect/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign IN"),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {widget.toggleView();},
              icon: Icon(Icons.person),
              label: Text("Register"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'email'),
                validator: (val) => val.isEmpty ? "Enter an email" : null,
                onChanged: (val) {setState(() => email = val);},
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'password'),
                validator: (val) => val.length < 6 ? "Enter a longer password" : null,
                obscureText:true,
                onChanged: (val) {setState(() => password = val);},),
              SizedBox(height: 20,),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  setState(() => loading = true);
                  if(_formKey.currentState.validate()) {
                    print("sign in form validation successfull");
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        loading = false;
                        error = "SignIn failded from firebase side";
                      });
                    }
                    print(error);
                  }
                  else{
                    print("sign in form validation failed");
                  }
                },
              ),
              SizedBox(height: 20,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
