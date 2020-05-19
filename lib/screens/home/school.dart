import 'package:flutter/material.dart';
import 'package:reconnect/services/crud.dart';
import 'package:reconnect/shared/chatMessages.dart';
import 'package:reconnect/shared/constants.dart';
import 'package:reconnect/shared/messageBox.dart';
import 'package:reconnect/shared/navbar.dart';

class SchoolChatRoom extends StatefulWidget {
	@override
	_SchoolChatRoomState createState() => _SchoolChatRoomState();
}

class _SchoolChatRoomState extends State<SchoolChatRoom> {

	final CrudMethods _crud = CrudMethods();
	String _uid;
	dynamic _userDetails;
	String _schoolChatroom;   // rn college name is not there in the db, so using school
	String message;

	preporcessing() async{
		_uid = await _crud.getUid();
		_userDetails = await _crud.getUserDetails(_uid);
		_schoolChatroom = _userDetails['school'] + _userDetails['school_batch'];
	}


	@override
	Widget build(BuildContext context) {
		preporcessing();
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
			body: Column(
				children: <Widget>[
					chatMessages(_schoolChatroom, _uid),
					messageBox(message, _uid, _schoolChatroom),
				],
			),
			drawer: NavDrawer(),

		);
	}
}
