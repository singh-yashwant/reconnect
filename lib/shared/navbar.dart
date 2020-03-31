import 'package:flutter/material.dart';
import 'package:reconnect/services/auth.dart';

class NavDrawer extends StatelessWidget {

	final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
			child: ListView(
				padding: EdgeInsets.zero,
				children: <Widget>[
					ListTile(),
					ListTile(
						leading: Icon(Icons.input),
						title: Text('Welcome'),
						onTap: () => {},
					),
					ListTile(
						leading: Icon(Icons.verified_user),
						title: Text('Profile'),
						onTap: () => {},
					),
					ListTile(
						leading: Icon(Icons.settings),
						title: Text('Settings'),
						onTap: () => {},
					),
					ListTile(
						leading: Icon(Icons.border_color),
						title: Text('Feedback'),
						onTap: () => {},
					),
					ListTile(
						leading: Icon(Icons.exit_to_app),
						title: Text('Logout'),
						onTap: () {_auth.signOut();},
					),
				],
			),
		);
  }
}
