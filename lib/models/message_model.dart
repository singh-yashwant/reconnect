import 'package:reconnect/models/user_model.dart';

class Message{
	final User sender;
	final String time;  //sending time
	final bool isLiked;
	final bool unread;

	Message({
		this.sender,
		this.time,
		this.isLiked,
		this.unread,
	});

}
