import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmmk_app/bloc/authentication/authentication_bloc.dart';
import 'package:mmmk_app/screen/bandsScreen.dart';
import 'package:mmmk_app/screen/reservationsScreen.dart';

import 'package:mmmk_app/screen/usersScreen.dart';

import 'dialogs/yesNoDialog.dart';

class MainDrawer extends StatelessWidget {
  final Map<String, String> _screenButtonsData = {
    "Foglalás": ReservationsScreen.routeName,
    "Tagok": UsersScreen.routeName,
    "Zenekarok": BandsScreen.routeName,
  };

  Widget _buildDrawerButton({Function onPressed, String text}) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }

  List<Widget> _buildScreenButtons(BuildContext context) {
    List<Widget> buttons = [];
    _screenButtonsData.forEach(
      (key, value) => buttons.add(
        _buildDrawerButton(
          text: key,
          onPressed: () => Navigator.of(context).pushReplacementNamed(value),
        ),
      ),
    );
    return buttons;
  }

  Widget _buildLogoutButton(BuildContext context) {
    return _buildDrawerButton(
      text: "Kijelentkezés",
      onPressed: () {
        YesNoDialog(title: "Biztosan kijelentkezik?").show(context).then(
          (result) {
            if (result == DialogResult.YES) {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              Navigator.of(context).pushReplacementNamed("/");
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Drawer(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "MMMK",
              style: Theme.of(context).appBarTheme.textTheme.headline1,
            ),
          ),
          body: Column(
            children: [
              ..._buildScreenButtons(context),
              _buildLogoutButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
