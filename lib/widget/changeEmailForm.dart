import 'package:flutter/material.dart';

import '../model/user.dart';
import 'formTemplate.dart';

class ChangeEmailForm extends StatelessWidget {
  final User _currentUser;
  final _formKey = GlobalKey<FormState>();

  ChangeEmailForm(this._currentUser);

  void _saveForm(BuildContext context) {
    if (!_formKey.currentState.validate()) return;
    try {
      //TODO: Email megváltoztatásának megoldása
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
    String email;
    String emailRepeat;

    return FormTemplate(
      title: "E-mail megváltoztatása",
      formKey: _formKey,
      formFields: [
          TextFormField(
            initialValue: _currentUser.email,
            decoration: InputDecoration(
              labelText: "E-mail",
            ),
            onChanged: (value) => email = value,
            validator: (value) => value == emailRepeat
                ? null
                : "A megadott e-mail címek nem egyeznek!",
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "E-mail újra",
            ),
            onFieldSubmitted: (value) => _currentUser.email = value,
            onChanged: (value) => emailRepeat = value,
            validator: (value) => value == email
                ? null
                : "A megadott e-mail címek nem egyeznek!",
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      onSubmit: () => _saveForm(context),
    );
  }
}
