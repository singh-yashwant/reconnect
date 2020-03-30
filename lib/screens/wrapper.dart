import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reconnect/models/user_model.dart';
import 'package:reconnect/screens/authenticate/authenticate.dart';
import 'package:reconnect/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  	final user = Provider.of<User>(context);
		print(user);
  	// return either home or authenticate widget
  	return user == null ? Authenticate() : Home();
  }
}
