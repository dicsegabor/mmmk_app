import 'package:flutter/material.dart';
import 'package:mmmk_app/screen/screenTemplate.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "",
      body: Center(
        child: CircularProgressIndicator(),
      ),
      showDrawer: false,
    );
  }
}
