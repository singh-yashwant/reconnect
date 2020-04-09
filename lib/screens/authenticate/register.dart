import 'package:flutter/material.dart';
import 'package:reconnect/services/auth.dart';
import 'package:reconnect/shared/constants.dart';
import 'package:reconnect/shared/loading.dart';

class Register extends StatefulWidget {

	final Function toggleView;
	Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

	final AuthService _auth = AuthService();
	final _formKey = GlobalKey<FormState>();
	bool loading = false;

	// text field state
	String email = "";
	String password = "";
	String name = "";
	String college = "";
	String college_batch = "";
	String school = "";
	String school_batch = "";
	String error = "";

	@override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
			backgroundColor: Colors.brown[100],
			appBar: AppBar(
				backgroundColor: Colors.brown[400],
				elevation: 0.0,
				title: Text("Sign UP"),
				actions: <Widget>[
					FlatButton.icon(
							onPressed: () {widget.toggleView();},
							icon: Icon(Icons.person),
							label: Text("SignIn"))
				],
			),
			body: Container(
				padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
				child: Form(
					key: _formKey,
					child: Column(
						children: <Widget>[
							SizedBox(height: 10,),
							TextFormField(
								decoration: textInputDecoration.copyWith(hintText: 'Name',),
								validator: (val) => val.isEmpty ? "Enter a valid name" : null,
								onChanged: (val) {setState(() => name = val);},
							),
							SizedBox(height: 10,),
							TextFormField(
								decoration: textInputDecoration.copyWith(hintText: 'college'),
								validator: (val) => val.isEmpty ? "Enter a valid college name" : null,
								onChanged: (val) {setState(() => college = val);},
							),
							SizedBox(height: 10,),
							TextFormField(
								decoration: textInputDecoration.copyWith(hintText: 'college grad year'),
								validator: (val) => val.isEmpty ? "Enter a valid year" : null,
								onChanged: (val) {setState(() => college_batch = val);},
							),
							SizedBox(height: 10,),
							TextFormField(
								decoration: textInputDecoration.copyWith(hintText: 'school name'),
								validator: (val) => val.isEmpty ? "Enter a valid school name" : null,
								onChanged: (val) {setState(() => school = val);},
							),
							SizedBox(height: 10,),
							TextFormField(
								decoration: textInputDecoration.copyWith(hintText: 'school grad year'),
								validator: (val) => val.isEmpty ? "Enter a valid year" : null,
								onChanged: (val) {setState(() => school_batch = val);},
							),
							SizedBox(height: 10,),
							SizedBox(height: 10,),
							TextFormField(
								decoration: textInputDecoration.copyWith(hintText: 'email'),
								validator: (val) => val.isEmpty ? "Enter a valid email" : null,
								onChanged: (val) {setState(() => email = val);},
							),
							SizedBox(height: 10,),
							TextFormField(
								decoration: textInputDecoration.copyWith(hintText: 'password'),
								validator: (val) => val.length < 6 ? "Enter a longer password" : null,
								obscureText:true,
								onChanged: (val) {setState(() => password = val);},),
							SizedBox(height: 20,),
							RaisedButton(
								color: Colors.pink[400],
								child: Text(
									"Register",
									style: TextStyle(color: Colors.white),
								),
								onPressed: () async {
									setState(() => loading = true);
									if(_formKey.currentState.validate()){
										dynamic result = await _auth.registerWithEmailAndPassword(email, password, name, school,
										college, school_batch, college_batch);
										if(result == null){
											setState(() {
											  error = "Firebase validation failed";
											  loading = false;
											});
											print(error);
										}
									}
									else{
										print("form validation faild");
										setState(() => loading = false);
									}
								},
							),
							SizedBox(height: 20,),
							Text(
								error,
								style: TextStyle(color: Colors.red, fontSize: 14),
							),
						],
					),
				),
			),
		);
  }
}
