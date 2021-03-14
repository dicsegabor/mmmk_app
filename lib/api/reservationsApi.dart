import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mmmk_app/api/apiUrls.dart';
import 'package:mmmk_app/model/reservation.dart';

Future<List<Reservation>> fetchReservations(String token) async {

  try {
    /*final http.Response response = await http.get(reservationsUrl + token);
    if(response.statusCode != 200)
      throw HttpException(json.decode(utf8.decode(response.bodyBytes))["detail"]);
    List<dynamic> extractedDataList = json.decode(utf8.decode(response.bodyBytes));*/
    List<dynamic> extractedDataList = [
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/36/",
        "start": "2021-02-26T09:30:00+01:00",
        "end": "2021-02-26T15:00:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/37/",
        "start": "2021-03-12T10:00:00+01:00",
        "end": "2021-03-12T14:30:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/40/",
        "start": "2022-05-19T13:00:00+02:00",
        "end": "2022-05-19T16:00:00+02:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/41/",
        "start": "2021-02-27T10:00:00+01:00",
        "end": "2021-02-27T14:30:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/42/",
        "start": "2021-02-25T09:00:00+01:00",
        "end": "2021-02-25T13:30:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/43/",
        "start": "2021-02-21T10:30:00+01:00",
        "end": "2021-02-21T13:30:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/47/",
        "start": "2021-02-19T08:00:00+01:00",
        "end": "2021-02-19T10:00:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/48/",
        "start": "2021-02-19T22:30:00+01:00",
        "end": "2021-02-19T23:00:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/49/",
        "start": "2021-02-20T10:00:00+01:00",
        "end": "2021-02-20T12:00:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/50/",
        "start": "2021-02-20T12:30:00+01:00",
        "end": "2021-02-20T15:00:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/51/",
        "start": "2021-02-20T15:00:00+01:00",
        "end": "2021-02-20T16:30:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/52/",
        "start": "2021-02-20T12:00:00+01:00",
        "end": "2021-02-20T12:30:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/53/",
        "start": "2021-02-20T16:30:00+01:00",
        "end": "2021-02-20T17:00:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/54/",
        "start": "2021-02-20T17:00:00+01:00",
        "end": "2021-02-20T17:30:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/55/",
        "start": "2021-02-20T08:00:00+01:00",
        "end": "2021-02-20T09:30:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/56/",
        "start": "2021-02-20T09:30:00+01:00",
        "end": "2021-02-20T10:00:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/57/",
        "start": "2021-02-20T18:00:00+01:00",
        "end": "2021-02-20T23:00:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/58/",
        "start": "2021-02-20T17:30:00+01:00",
        "end": "2021-02-20T18:00:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      },
      {
        "url": "http://127.0.0.1:8000/api/v1/reservations/59/",
        "start": "2021-02-24T11:30:00+01:00",
        "end": "2021-02-24T21:00:00+01:00",
        "reservation_type": "USER",
        "title": "Test Test (admin)",
        "color": "green",
        "owner_id": 1,
        "owner_type": 13,
        "note": ""
      }
    ];
    return extractedDataList.map((e) => Reservation.fromMap(e)).toList();
  } catch (error) {
    throw error;
  }
}