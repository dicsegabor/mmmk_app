import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mmmk_app/api/apiUrls.dart';
import 'package:mmmk_app/model/user.dart';

Future<List<User>> fetchUsers(String token) async {
  try {
    final http.Response response =
        await http.get(usersUrl, headers: {"Authorization": token});
    if (response.statusCode != 200)
      throw HttpException(json.decode(utf8.decode(response.bodyBytes)));
    List<dynamic> extractedDataList =
        json.decode(utf8.decode(response.bodyBytes));
    return extractedDataList.map((e) => User.fromMap(e)).toList();
  } catch (error) {
    throw error;
  }
}

Future<User> fetchUser(String username, String token) async {
  try {
    final http.Response response = await http.get(username);
    final extractedData = json.decode(response.body);
    return User.fromMap(extractedData);
  } catch (error) {
    // TODO: hibakezelés saját exceptionnel
    throw error;
  }
}
