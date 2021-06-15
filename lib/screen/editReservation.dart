import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mmmk_app/model/reservation.dart';
import 'package:mmmk_app/repo/repository.dart';
import 'package:mmmk_app/screen/screenTemplate.dart';
import 'package:provider/provider.dart';

class EditReservationScreen extends StatefulWidget {
  final DateTime _dateTime;

  EditReservationScreen(this._dateTime);

  @override
  _EditReservationScreenState createState() => _EditReservationScreenState();
}

class _EditReservationScreenState extends State<EditReservationScreen> {
  @override
  Widget build(BuildContext context) {
    /*var reservation = Provider.of<Repository>(context).reservations.firstWhere(
        (e) =>
            e.start.compareTo(widget._dateTime) >= 0 &&
            e.start.compareTo(widget._dateTime) <= 0);*/

    return ScreenTemplate(
      title: "Edit reservation",
      body: Center(
        child: Text(widget._dateTime.toString()),
      ),
      showUserButton: false,
      showDrawer: false,
    );
  }
}
