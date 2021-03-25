import 'package:flutter/material.dart';

class Reservation {
  String url;
  DateTime start;
  DateTime end;
  String title;
  Color color;

  Reservation(this.url, this.start, this.end, this.title, this.color);

  Reservation.fromMap(Map<String, dynamic> data) {
    url = data["url"];
    start = DateTime.parse(data["start"]);
    end = DateTime.parse(data["end"]);
    title = data["title"];
    color = Colors.green;
  }
  
  /// Use DateTime.weekday for it
  bool isOnThisWeekDay(int day) => start.weekday == day;
}
