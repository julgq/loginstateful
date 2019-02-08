import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  // https://docs.flutter.io/flutter/widgets/FormState-class.html
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              emailField(),
              Container(margin: EdgeInsets.only(top: 25.0)),
              passwordField(),
              Container(margin: EdgeInsets.only(top: 25.0)),
              submitButton()
            ],
          ),
        ));
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Email Address', hintText: 'you@example.com'),
      validator: (value) {
        // return null if valid
        // otherwise string (with the error message) if invalid
        if (!value.contains('@')) {
          return 'Please enter a valid email';
        }
      },
    );
  }

  Widget passwordField() {
    return Container(
      margin: EdgeInsets.only(bottom: 25.0),
      child: TextFormField(
        obscureText: true,
        decoration:
            InputDecoration(labelText: 'Enter Password', hintText: 'Password'),
        validator: (value) {
          if (value.length < 4) {
            return 'Password must be at least 4 characters';
          }
        },
      ),
    );
  }

  Widget submitButton() {
    return RaisedButton(
        color: Colors.blue,
        child: Text('Submit'),
        onPressed: () {
          /* reinicia los campos del formulario */
          formKey.currentState.reset();
        });
  }
}
