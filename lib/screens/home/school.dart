import 'package:flutter/material.dart';
import 'package:reconnect/shared/navbar.dart';

class SchoolChatRoom extends StatefulWidget {
	@override
	_SchoolChatRoomState createState() => _SchoolChatRoomState();
}

class _SchoolChatRoomState extends State<SchoolChatRoom> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Colors.brown[400],
				title: Text("school chat room"),
				actions: <Widget>[
					FlatButton.icon(
						label: Text(""),
						icon: Icon(
								Icons.arrow_back,
								color: Colors.white,),
						onPressed: () {Navigator.pop(context);},
					),
				],
			),
			body: Center(
				child: RaisedButton(
					color: Colors.brown[300],
					onPressed: () {},
					child: Text("Do Nothing"),
				),
			),
			drawer: NavDrawer(),

		);
	}
}
