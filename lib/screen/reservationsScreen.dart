import 'package:flutter/material.dart';
import 'package:mmmk_app/repo/repository.dart';
import 'package:mmmk_app/screen/screenTemplate.dart';
import 'package:mmmk_app/widget/calendarView.dart';
import 'package:provider/provider.dart';

class ReservationsScreen extends StatelessWidget {
  static const routeName = "reservations";

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Foglalás",
      body: CalendarView(Provider.of<Repository>(context).reservations),
    );
  }
}
