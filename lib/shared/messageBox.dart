import 'package:flutter/material.dart';
import 'package:reconnect/services/crud.dart';

import 'constants.dart';

class messageBox extends StatefulWidget {
	String message;
	String uid;
	String chatroomId;

	messageBox(this.message, this.uid, this.chatroomId);

  @override
  _messageBoxState createState() => _messageBoxState();
}

class _messageBoxState extends State<messageBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
			child: Row(
				children: <Widget>[
					Container(
						width: MediaQuery.of(context).size.width * 0.8,
						child: TextFormField(
							decoration: textInputDecoration.copyWith(hintText: "type your message"),
							onChanged: (val) {widget.message = val;},
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
								CrudMethods().saveMessage(widget.message, widget.uid, widget.chatroomId);
							},
						),
					),
				],
			),
		);
  }
}

