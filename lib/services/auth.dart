import 'package:firebase_auth/firebase_auth.dart';
import 'package:reconnect/models/user_model.dart';

class AuthService {

	final FirebaseAuth _auth = FirebaseAuth.instance;

	// create user object from firebase user object
	User _userFromFirebaseUser(FirebaseUser user){
		return user != null ? User(uid: user.uid) : null;
	}

	// auth change user stream
	Stream<User> get user {
		return _auth.onAuthStateChanged
				.map((FirebaseUser user) => _userFromFirebaseUser(user));
	}

	// signin anon
	Future signInAnon() async {
		try{
			AuthResult result = await _auth.signInAnonymously();
			FirebaseUser user = result.user;
			return _userFromFirebaseUser(user);
		}catch(e){
			print(e.toString());
			return null;
		}
	}

	// singIn email and password

	// register with email and password

	// sign out
	Future signOut() async {
		try{
			return await _auth.signOut();
		}
		catch(e){
			print(e.toString());
			return null;
		}
	}

}