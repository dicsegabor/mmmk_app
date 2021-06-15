import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mmmk_app/api/apiUrls.dart';
import 'package:mmmk_app/model/reservation.dart';
import 'package:mmmk_app/dummyData.dart';

Future<Map<int, List<Reservation>>> fetchReservations(String token) async {
  Map<int, List<Reservation>> reservationsByDay = {};

  try {
    /*final http.Response response = await http.get(reservationsUrl + token);
    if(response.statusCode != 200)
      throw HttpException(json.decode(utf8.decode(response.bodyBytes))["detail"]);
    List<dynamic> extractedDataList = json.decode(utf8.decode(response.bodyBytes));*/
    List<dynamic> extractedDataList = [...reservationsList];
    List<Reservation> reservations =
        extractedDataList.map((e) => Reservation.fromMap(e)).toList();
    reservations.forEach((e) {
      if (!reservationsByDay.containsKey(e.timeRange.start.weekday))
        reservationsByDay.putIfAbsent(e.timeRange.start.weekday, () => []);
      reservationsByDay[e.timeRange.start.weekday].add(e);
    });

    reservationsByDay.keys
        .forEach((e) => reservationsByDay[e].sort(Reservation.compare));

    return reservationsByDay;
  } catch (error) {
    throw error;
  }
}
