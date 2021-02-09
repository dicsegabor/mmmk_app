import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mmmk_app/model/user.dart';

const String apiUrl = "";
const String usersUrl = "/users";

Future<List<User>> fetchUsers(String token) async {
  final String url = apiUrl + usersUrl + token;
  // TODO: csak teszthez kellett
  await Future.delayed(const Duration(seconds: 2), () => "2");
  try {
    final http.Response response = await http.get(url);
    List<Map<String, dynamic>> userMapList = json.decode(response.body);
    List<User> items = userMapList.map((e) => User.fromMap(e)).toList();
    return items;
  } catch (error) {
    // TODO: hibakezelés saját exceptionnel
    throw error;
  }
}
