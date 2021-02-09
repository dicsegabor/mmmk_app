import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmmk_app/bloc/login/login_bloc.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final Map<String, String> loginData = {
    "username": "",
    "password": "",
  };

  void _saveForm(BuildContext context) {
    if (!_formKey.currentState.validate()) return;
    BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
      username: loginData["username"],
      password: loginData["password"],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Felhasználónév"),
              onSaved: (value) => loginData["username"] = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Jelszó"),
              validator: (value) =>
                  value.length < 5 ? "A megadott jelszó túl rövid" : null,
              onSaved: (value) => loginData["password"] = value,
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () => _saveForm(context),
              child: Text("Bejelentkezés"),
            ),
          ],
        ),
      ),
    );
  }
}
