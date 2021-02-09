import 'package:flutter/material.dart';
import 'package:mmmk_app/widget/mainDrawer.dart';

class ScreenTemplate extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget> actions;
  final bool showDrawer;

  const ScreenTemplate({
    @required this.title,
    @required this.body,
    this.actions,
    this.showDrawer = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
        actions: [
          if (actions != null) ...actions,
        ],
      ),
      drawer: showDrawer ? MainDrawer() : null,
      body: body,
    );
  }
}
