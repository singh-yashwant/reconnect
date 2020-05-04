import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reconnect/models/user_model.dart';
import 'package:reconnect/services/crud.dart';

class AuthService {

	final FirebaseAuth _auth = FirebaseAuth.instance;

	final CrudMethods crud = CrudMethods();

	// create user object from firebase user object
	User _userFromFirebaseUser(FirebaseUser user) {
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
	Future signInWithEmailAndPassword(String email, String password) async{

		try{
			AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
			FirebaseUser user = result.user;

			return _userFromFirebaseUser(user);
		}catch(e){
			print(e.toString());
			return null;
		}
	}

	// register with email and password
	Future registerWithEmailAndPassword(String email, String password, String name,
			String school, String college, String school_batch, String college_batch) async{
		try{
			AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
			FirebaseUser user = result.user;

			crud.createEntryInUsersCollection(user, email, password, name, school, college, school_batch, college_batch);
			crud.createEntryInSchoolCollection(school, school_batch, user.uid);
			crud.createEntryInCollegeCollection(college, college_batch, user.uid);

			//call functions to create chatrooms

			return _userFromFirebaseUser(user);
		}
		catch(e){
			print(e.toString());
			return null;
		}
	}

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