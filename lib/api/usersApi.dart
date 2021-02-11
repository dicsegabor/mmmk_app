import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mmmk_app/api/apiUrls.dart';
import 'package:mmmk_app/model/user.dart';

Future<List<User>> fetchUsers(String token) async {

  try {
    final http.Response response = await http.get(usersUrl + token);
    List<dynamic> extractedDataList = json.decode(response.body);
    return extractedDataList.map((e) => User.fromMap(e)).toList();
  } catch (error) {
    // TODO: hibakezelés saját exceptionnel
    throw error;
  }
}

Future<User> fetchUser(String userUrl) async {
  try {
    final http.Response response = await http.get(userUrl);
    final extractedData = json.decode(response.body);
    return User.fromMap(extractedData);
  } catch (error) {
    // TODO: hibakezelés saját exceptionnel
    throw error;
  }
}
