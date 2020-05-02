// this is a prototype for message box to move all message input code form college and school chatroom files


import 'package:flutter/material.dart';
import 'package:reconnect/shared/constants.dart';
import 'package:reconnect/services/crud.dart';


class messageBox extends StatefulWidget {
  @override
	String message, _uid, _collegeChatroom;
  messageBox(this.message, this._uid, this._collegeChatroom);
  _messageBoxState createState() => _messageBoxState(message, _uid, _collegeChatroom);
}

class _messageBoxState extends State<messageBox> {



	String message, _uid, _collegeChatroom;
	final CrudMethods _crud = CrudMethods();

	_messageBoxState(this.message, this._uid, this._collegeChatroom);

	@override
  Widget build(BuildContext context) {
    return Container(
			child: Row(
				children: <Widget>[
					Container(
						width: MediaQuery.of(context).size.width * 0.8,
						child: TextFormField(
							decoration: textInputDecoration.copyWith(hintText: "type your message"),
							onChanged: (val) {setState(() => message = val);},
						),
					),
					Container(
						width: MediaQuery.of(context).size.width *0.2,
						child: FlatButton.icon(
							label: Text(""),
							icon: Icon(
								Icons.send,
								color: Colors.grey,
							),
							onPressed: (){
								_crud.saveMessage(message, _uid, _collegeChatroom);
							},
						),
					),
				],
			),
		);
  }
}
