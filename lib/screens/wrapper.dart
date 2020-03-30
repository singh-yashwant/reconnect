import 'package:flutter/material.dart';
import 'package:reconnect/screens/authenticate/authenticate.dart';
import 'package:reconnect/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  	// return either home or authenticate widget
  	return Authenticate();
  }
}
