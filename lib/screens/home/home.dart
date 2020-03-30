import "package:flutter/material.dart";
import 'package:reconnect/services/auth.dart';

class Home extends StatelessWidget {

	final AuthService _auth = AuthService();

	@override
  Widget build(BuildContext context) {
    return Scaffold(
			backgroundColor: Colors.brown[100],
			appBar: AppBar(
				title: Text("Home page"),
				backgroundColor: Colors.brown[500],
				elevation: 0.0,
				actions: <Widget>[
					FlatButton.icon(
							onPressed: () async{
								await _auth.signOut();
							},
							icon: Icon(Icons.person),
							label: Text("log out"))
				],
			),
		);
  }
}
