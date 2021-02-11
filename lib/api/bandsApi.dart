import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mmmk_app/api/apiUrls.dart';
import 'package:mmmk_app/model/band.dart';
import 'package:mmmk_app/model/user.dart';

Future<List<Band>> fetchBands(String token, List<User> users) async {
  try {
    final http.Response response = await http.get(bandsUrl + token);
    List<dynamic> extractedDataList = json.decode(response.body);
    return extractedDataList.map((e) {
      Band band = Band.fromMap(e);
      // TODO: ezt esetleg megfixálni a jövőben
      (e["members"] as List<dynamic>).forEach((element) {
        band.members
            .add(users.firstWhere((user) => user.url == element).fullName);
      });
      return band;
    }).toList();
  } catch (error) {
    // TODO: hibakezelés saját exceptionnel
    throw error;
  }
}
