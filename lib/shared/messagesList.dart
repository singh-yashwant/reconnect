import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageTile extends StatelessWidget {
	@override

	String text;
	bool color;
	Color c = Colors.grey;
	String time;

	MessageTile(List message){
		this.text = message[0];
		this.color = message[1];
		this.time = message[2];
		if(color){
			c = Colors.white;
		}
		else{
			c = Colors.grey;
		}
	}

	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.only(top: 5, left: 5),
			child: Card(
				color: c,
				margin: EdgeInsets.fromLTRB(3, 0, 3, 0),
				child: ListTile(
					title: Text(text),
					subtitle: Text(time),
				),
			),
		);
	}
}


class messageList extends StatefulWidget {

	final chatRoomId;
	final currentUserUid;
	messageList(this.chatRoomId, this.currentUserUid);

  @override
  _messageListState createState() => _messageListState();
}

class _messageListState extends State<messageList> {

	@override
  Widget build(BuildContext context) {

//		dynamic messages = Provider.of<DocumentSnapshot>(context);
//
//
//		var message_list = [];
//		messages.data.forEach((key, value) {message_list.add(value["text"]); });
//		print(messages);
//		return ListView.builder(
//			itemCount: message_list.length,
//			itemBuilder: (context, index) {
//				return MessageTile(text: message_list[index]);
//			},
//		);

		var message_list = [];
		final messages = Provider.of<QuerySnapshot>(context);
		for(var doc in messages.documents){
			if(doc.documentID == widget.chatRoomId) {
//				print(doc.data);
				doc.data.forEach((key, value) {
					String sendTime = value['time'].toDate().toString().substring(0, 16);
					if(value['sender'] == widget.currentUserUid) {
						message_list.add([value["text"], true, sendTime]);
					}
					else{
						message_list.add([value["text"], false, sendTime]);
					}
				});
			}
		}
		print(message_list);
		print(message_list.runtimeType);
		return ListView.builder(
			itemCount: message_list.length,
			itemBuilder: (context, index) {
				return MessageTile(message_list[index]);
			},
		);

  }
}
