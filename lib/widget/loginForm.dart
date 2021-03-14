import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmmk_app/bloc/login/login_bloc.dart';
import 'package:mmmk_app/widget/formTemplate.dart';

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
    return FormTemplate(
      formKey: _formKey,
      formFields: [
        TextFormField(
          decoration: InputDecoration(labelText: "Felhasználónév"),
          onSaved: (value) => loginData["username"] = value,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Jelszó"),
          //validator: (value) =>
          //  value.length < 5 ? "A megadott jelszó túl rövid" : null,
          onSaved: (value) => loginData["password"] = value,
          obscureText: true,
        ),
      ],
      submitText: "Bejelentkezés",
      onSubmit: () => _saveForm(context),
    );
  }
}
