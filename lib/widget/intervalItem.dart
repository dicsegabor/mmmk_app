import 'package:flutter/material.dart';
import 'package:mmmk_app/model/reservation.dart';

class IntervalItem extends StatelessWidget {
  final Reservation reservation;

  IntervalItem(this.reservation);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text("asd"),
      ),
    );
  }
}
