import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reconnect/services/crud.dart';
import 'messagesList.dart';

class chatMessages extends StatelessWidget {

	String chatRoomId;
	String currentUserUid;
	chatMessages(this.chatRoomId, this.currentUserUid);

	@override
  Widget build(BuildContext context) {
//    return StreamProvider<DocumentSnapshot>.value(
//			value:CrudMethods().textMessages(chatRoomId),
//      child: Container(
//			height: MediaQuery.of(context).size.height * 0.8,
//			child: messageList(),
//		),
//    );

		return StreamProvider<QuerySnapshot>.value(
			value: CrudMethods().msgs,
			child: Container(
				height: MediaQuery.of(context).size.height * 0.8,
				child: messageList(chatRoomId, currentUserUid),
			),
		);
  }
}
