import 'package:flutter/material.dart';
import 'package:reconnect/shared/navbar.dart';

class CollegeChatRoom extends StatefulWidget {
  @override
  _CollegeChatRoomState createState() => _CollegeChatRoomState();
}

class _CollegeChatRoomState extends State<CollegeChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
			appBar: AppBar(
				backgroundColor: Colors.brown[400],
				title: Text("college chat room"),
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
