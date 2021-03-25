import 'package:flutter/material.dart';
import 'package:mmmk_app/model/reservation.dart';
import 'package:mmmk_app/widget/intervalItem.dart';

class ReservationsList extends StatelessWidget {
  final List<Reservation> _reservations;

  ReservationsList(this._reservations);

  @override
  Widget build(BuildContext context) {
    Duration interval = Duration(minutes: 30);
    List<Reservation> intervals = [];

    // from 8 to midnight
    DateTime beginning = DateTime.utc(2020, 1, 1, 8);
    DateTime end = DateTime.utc(2020, 1, 2);

    while (beginning.compareTo(end) < 0) {
      intervals.add(null);
      beginning = beginning.add(interval);
    }

    return ListView.builder(
      itemCount: intervals.length,
      itemBuilder: (context, i) => IntervalItem(intervals[i]),
    );
  }
}
