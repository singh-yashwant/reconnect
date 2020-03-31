import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class CrudMethods {

	bool isLoggedIn(){
		return FirebaseAuth.instance.currentUser() == null ? false : true;
	}

	// create a entry in firestore users db
	Future createEntryInUsersCollection(FirebaseUser user, String email,
			String password, String name,
			String school, String college, String school_batch,
			String college_batch) async {
		try {
			await Firestore.instance.collection("users").document(user.uid.toString())
					.setData({
				"uid": user.uid.toString(),
				"name": name,
				"email": email,
				"password": password,
				"school": school,
				"school_batch": school_batch,
				"college": college,
				"college": college_batch,
			});
		} catch (e) {
			print("------unable to write to firestore\n");
			print(e);
		}
	}


	// create entry in schools database
	Future createEntryInSchoolsCollection(String school, String school_batch,
			String uid) async {
		try {
			await Firestore.instance.collection("schools").document(school)
					.collection("year").document(school_batch)
					.updateData({
				"users": {uid: true,},
			});
		}
		on PlatformException {
			print("platform exception handled");
			await Firestore.instance.collection("schools").document(school)
					.collection("year").document(school_batch)
					.setData({
				"users": {uid: true,},
			});
		}
		catch (e) {
			print("can't save data to school collection");
			print(e.toString());
		}
	}


	// create entry in college database
	Future createEntryInCollegeCollection(String college, String college_batch,
			String uid) async {

	}

// create message entry for school database


// create message entry for college database
}