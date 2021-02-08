import 'package:flutter/material.dart';

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
        title: Text(title),
        actions: [
          if(actions != null) ...actions,
        ],
      ),
      drawer: showDrawer ? null : null,
      body: body,
    );
  }
}
