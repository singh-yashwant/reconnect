import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class messageList extends StatefulWidget {
  @override
  _messageListState createState() => _messageListState();
}

class _messageListState extends State<messageList> {

	@override
  Widget build(BuildContext context) {

		dynamic messages = Provider.of<DocumentSnapshot>(context);


		var message_list = [];
		messages.data.forEach((key, value) {message_list.add(value["text"]); });
		print(messages);
		return ListView.builder(
			itemCount: message_list.length,
			itemBuilder: (context, index) {
				return MessageTile(text: message_list[index]);
			},
		);

  }
}


class MessageTile extends StatelessWidget {
  @override

	final String text;
	MessageTile({this.text});

  Widget build(BuildContext context) {
    return Padding(
			padding: EdgeInsets.only(top: 5, left: 5),
			child: Card(
				margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
				child: ListTile(
					title: Text(text),
					subtitle: Text("send time"),
				),
			),
		);
  }
}
