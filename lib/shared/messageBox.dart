import 'package:flutter/material.dart';

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

		);
  }
}

