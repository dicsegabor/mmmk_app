import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../bloc/authentication/authentication_bloc.dart';
import '../model/user.dart';
import '../repo/repository.dart';
import 'formTemplate.dart';

class EditUserDataForm extends StatelessWidget {
  final User _currentUser;

  EditUserDataForm(this._currentUser);
  
  final _formKey = GlobalKey<FormState>();

  Future<void> _saveForm(BuildContext context) async {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();

    try {
      //TODO: Patch the user on the server
      Provider.of<Repository>(context).fetchAndSetUsers(
          BlocProvider.of<AuthenticationBloc>(context).currentUser.token);
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
    return FormTemplate(
      title: "Profil",
      formKey: _formKey,
      formFields: [
        TextFormField(
          decoration: InputDecoration(labelText: "Vezetéknév"),
          initialValue: _currentUser.lastName,
          textInputAction: TextInputAction.done,
          validator: (value) =>
              value.isEmpty ? "A mezőt kötelező megadni" : null,
          onSaved: (value) => _currentUser.lastName = value,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Keresztnév"),
          initialValue: _currentUser.firstName,
          textInputAction: TextInputAction.done,
          validator: (value) =>
              value.isEmpty ? "A mezőt kötelező megadni" : null,
          onSaved: (value) => _currentUser.firstName = value,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Telefonszám"),
          keyboardType: TextInputType.phone,
          initialValue: _currentUser.profile.telephone,
          textInputAction: TextInputAction.done,
          validator: (value) =>
              value.isEmpty ? "A mezőt kötelező megadni" : null,
          onSaved: (value) => _currentUser.profile.telephone = value,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Kollégium"),
          initialValue: _currentUser.profile.dormitory,
          textInputAction: TextInputAction.done,
          validator: (value) =>
              value.isEmpty ? "A mezőt kötelező megadni" : null,
          onSaved: (value) => _currentUser.profile.dormitory = value,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Szobaszám"),
          keyboardType: TextInputType.number,
          initialValue: _currentUser.profile.room,
          textInputAction: TextInputAction.done,
          validator: (value) {
            if (value.isEmpty) return "A mezőt kötelező megadni";
            if (int.tryParse(value) == null)
              return "A megadott értéken egész számnak kell lennie";
            return null;
          },
          onSaved: (value) => _currentUser..profile.room = value,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Kar"),
          initialValue: _currentUser.profile.faculty,
          textInputAction: TextInputAction.done,
          validator: (value) =>
              value.isEmpty ? "A mezőt kötelező megadni" : null,
          onSaved: (value) => _currentUser..profile.faculty = value,
        ),
      ],
      onSubmit: () => _saveForm(context),
    );
  }
}
