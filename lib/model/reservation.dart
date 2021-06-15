import 'package:mmmk_app/model/user.dart';
import 'package:flutter/material.dart';

class Reservation {
  String url;
  String title;
  DateTimeRange timeRange;
  Color color;
  User admissioner;

  Reservation({
    this.url,
    this.title,
    this.timeRange,
    this.color,
    this.admissioner,
  });

  Reservation.fromMap(Map<String, dynamic> data) {
    url = data['url'];
    title = data['title'];
    timeRange = DateTimeRange(
      start: DateTime.parse(data['start']),
      end: DateTime.parse(data['end']),
    );
    color = Color(int.parse("88${data['color']}", radix: 16));
    //admissioner = data['admissioner'];
  }

  static int compare(Reservation reservation1, Reservation reservation2) {
    return reservation1.timeRange.start.compareTo(reservation2.timeRange.start);
  }
}
