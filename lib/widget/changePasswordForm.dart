import 'package:flutter/material.dart';

import '../model/user.dart';
import 'formTemplate.dart';

class ChangePasswordForm extends StatefulWidget {
  final User _currentUser;

  ChangePasswordForm(this._currentUser);

  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  void _saveForm(BuildContext context) {
    if (!_formKey.currentState.validate()) return;
    try {
      //TODO: Jelszó megváltoztatásának megoldása
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Sikertelen mentés",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Sikeres mentés",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String pw;
    String pwRepeat;

    return FormTemplate(
      title: "Jelszó megváltoztatása",
      formKey: _formKey,
      formFields: [
        TextFormField(
          decoration: InputDecoration(
            labelText: "Jelszó",
          ),
          validator: (value) =>
              value == pwRepeat ? null : "A megadott jelszavak nem egyeznek!",
          textInputAction: TextInputAction.next,
          obscureText: obscureText,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Jelszó újra",
          ),
          validator: (value) =>
              value == pw ? null : "A megadott jelszavak nem egyeznek!",
          textInputAction: TextInputAction.done,
          obscureText: obscureText,
        ),
        TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( obscureText ? "Mutat" : "Elrejt"),
              SizedBox(width: 10),
              Icon(obscureText
                  ? Icons.remove_red_eye
                  : Icons.remove_red_eye_outlined),
            ],
          ),
          onPressed: obscureText
              ? () => setState(() => obscureText = false)
              : () => setState(() => obscureText = true),
        ),
      ],
      onSubmit: () => _saveForm(context),
    );
  }
}
