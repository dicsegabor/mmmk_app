import 'package:flutter/material.dart';
import 'package:mmmk_app/repo/repository.dart';
import 'package:mmmk_app/screen/screenTemplate.dart';
import 'package:provider/provider.dart';

class ReservationsScreen extends StatelessWidget {
  static const routeName = "reservations";

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Foglalás",
      body: ListView.builder(
        itemCount: Provider.of<Repository>(context).reservations.length,
        itemBuilder: (context, index) =>
            Text(Provider.of<Repository>(context).reservations[index].title),
      ),
      showDrawer: true,
    );
  }
}
