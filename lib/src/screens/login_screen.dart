import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> with ValidationMixin {
  // https://docs.flutter.io/flutter/widgets/FormState-class.html
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

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
      validator: validateEmail,
      onSaved: (value) {
        print(value);
        email = value;
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
        validator: validatePassword,
        onSaved: (value) {
          print(value);
          password = value;
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
          //formKey.currentState.reset();

          /* Validar formulario */
          // regresara true si esta validado, si no false.
          //print(formKey.currentState.validate());

          if (formKey.currentState.validate()) {
            // Guardar valores de inputs en el state del formulario.
            formKey.currentState.save();

            // take *both* email and password
            // and post them to some API.
            print(' Time to post $email and $password to my API');
          }
        });
  }
}
