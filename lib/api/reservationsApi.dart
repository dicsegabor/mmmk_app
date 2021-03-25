import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mmmk_app/api/apiUrls.dart';
import 'package:mmmk_app/model/reservation.dart';
import 'package:mmmk_app/dummyData.dart';

Future<List<Reservation>> fetchReservations(String token) async {

  try {
    /*final http.Response response = await http.get(reservationsUrl + token);
    if(response.statusCode != 200)
      throw HttpException(json.decode(utf8.decode(response.bodyBytes))["detail"]);
    List<dynamic> extractedDataList = json.decode(utf8.decode(response.bodyBytes));*/
    List<dynamic> extractedDataList = [...reservationsList];
    return extractedDataList.map((e) => Reservation.fromMap(e)).toList();
  } catch (error) {
    throw error;
  }
}