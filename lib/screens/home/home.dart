import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:reconnect/screens/home/college.dart';
import 'package:reconnect/screens/home/school.dart';
import 'package:reconnect/services/auth.dart';
import 'package:reconnect/shared/navbar.dart';

class Home extends StatelessWidget {


	@override
  Widget build(BuildContext context) {
    return Scaffold(
			backgroundColor: Colors.brown[100],
			appBar: AppBar(
				title: Text("Home page"),
				backgroundColor: Colors.brown[500],
				elevation: 0.0,
				actions: <Widget>[

				],
			),
			drawer: NavDrawer(),
			body: Center(
				child:Column(
					children: <Widget>[
						SizedBox(height: 100,),
						RaisedButton(
							onPressed: () {
								Navigator.push(
									context,
									MaterialPageRoute(builder: (context) => CollegeChatRoom()),
								);
							},
							color: Colors.brown[300],
							highlightColor: Colors.brown[100],
							child: Text("College chat room"),
						),
						SizedBox(height: 30,),
						RaisedButton(
							onPressed: () {
								Navigator.push(
									context,
									MaterialPageRoute(builder: (context) => SchoolChatRoom()),
								);
							},
							color: Colors.brown[300],
							highlightColor: Colors.brown[100],
							child: Text("School chat room"),
						),
					],
				) ,
			),
		);
  }
}
