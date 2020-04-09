import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class CrudMethods {

	final db = Firestore.instance;

	bool isLoggedIn(){
		return FirebaseAuth.instance.currentUser() == null ? false : true;
	}

	// fetch all user details to create custom user object

	Future getUserDetails(String uid) async {
		var doc = await db.collection("users").document(uid).get();
		return doc.data;
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
				"college_batch": college_batch,
			});

		} catch (e) {
			print("------unable to write to firestore\n");
			print(e);
		}
	}


	// create entry in schools database
	Future createEntryInSchoolCollection(String school, String school_batch,
			String uid) async {
		try {
			 DocumentReference school_users = await db
					.collection("schools").document(school)
					.collection(school_batch).document("users");

			try {
				await school_users.updateData({
					uid: true,
				});
			}on PlatformException{
				print("*****document dosen't exist so creating one*********");
				await school_users.setData({
					uid: true,
				});
			}
		} catch (e) {
			print("---------cant add data to school collection");
			print(e.toString());
		}
	}


	// create entry in college database
	Future createEntryInCollegeCollection(String college, String college_batch,
			String uid) async {
		try {
			DocumentReference college_users = await db
					.collection("colleges").document(college)
					.collection(college_batch).document("users");

			try {
				await college_users.updateData({
					uid: true,
				});
			} on PlatformException {
				print("*****document dosen't exist so creating one*********");
				await college_users.setData({
					uid: true,
				});
			}
		} catch (e) {
			print("---------cant add data to college collection");
			print(e.toString());
		}
	}


	// function to get name of chatrooms
	Future getChatrooms(uid) async {
		DocumentReference doc = await db.collection("users").document(uid);
		print("*****************");

//		String school = db.collection("users").document(FirebaseAuth.instance.currentUser().toString()).data['school'];
		await print(doc.get());
		print("*****************");


	}

	// functions to create chatrooms


	// create function to retrive messages form school chatroom


	// create function to retrive messages from college chatroom


	// function to save messages in chatroom collection


}