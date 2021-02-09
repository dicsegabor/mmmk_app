import 'package:flutter/material.dart';
import 'package:mmmk_app/screen/screenTemplate.dart';

class ReservationsScreen extends StatelessWidget {
  static const routeName = "reservations";

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Foglalás",
      body: Container(),
      showDrawer: true,
    );
  }
}
