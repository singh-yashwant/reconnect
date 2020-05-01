import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reconnect/services/crud.dart';
import 'package:reconnect/shared/navbar.dart';

class CollegeChatRoom extends StatefulWidget {
  @override
  _CollegeChatRoomState createState() => _CollegeChatRoomState();
}

class _CollegeChatRoomState extends State<CollegeChatRoom> {

	final CrudMethods _crud = CrudMethods();
	String _uid;
	dynamic _userDetails;
	String _collegeChatroom;   // rn college name is not there in the db, so using school

	preporcessing() async{
		_uid = await _crud.getUid();
		_userDetails = await _crud.getUserDetails(_uid);
		_collegeChatroom = _userDetails['school'] + _userDetails['school_batch'];
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
			body: Center(
				child: RaisedButton(
					color: Colors.brown[300],
					onPressed: () {
						_crud.saveMessage("hello this is first text", _uid, _collegeChatroom);
					},
					child: Text("Debug button"),
				),
			),
			drawer: NavDrawer(),
		);
  }
}
