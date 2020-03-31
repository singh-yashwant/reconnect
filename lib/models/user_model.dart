import 'package:reconnect/services/crud.dart';

class User {

//		final String name;
//	final String imageUrl;

	final String uid;
	String school;
//	final String college;
//	final String school_batch;
//	final String college_batch;
//	final String password;
//	final String email;

	User({this.uid,}){
		fillUserDetails(uid);
	}

	Future fillUserDetails(String uid) async {
		var data = CrudMethods().getUserDetails(uid);
		print(data.toString());
//		school = data['school'];
	}

}
