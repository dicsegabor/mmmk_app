import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmmk_app/bloc/authentication/authentication_bloc.dart';
import 'package:mmmk_app/widget/mainDrawer.dart';

class ScreenTemplate extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget> actions;
  final AppBar appBar;
  final bool showDrawer;
  final bool showUserButton;

  ScreenTemplate({
    @required this.title,
    @required this.body,
    this.appBar,
    this.actions,
    this.showDrawer = true,
    this.showUserButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          AppBar(
            title: Text(
              title,
              style: Theme.of(context).appBarTheme.textTheme.headline1,
            ),
            actions: [
              if (actions != null) ...actions,
              if (showUserButton)
                RaisedButton(
                  onPressed: () {
                    //TODO: userdata screen
                  },
                  child: Text(BlocProvider.of<AuthenticationBloc>(context).currentUser.username),
                ),
            ],
          ),
      drawer: showDrawer ? MainDrawer() : null,
      body: body,
    );
  }
}
