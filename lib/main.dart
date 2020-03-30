import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reconnect/models/user_model.dart';
import 'package:reconnect/screens/wrapper.dart';
import 'package:reconnect/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
