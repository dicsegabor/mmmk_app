import 'dart:convert';

import 'package:mmmk_app/model/token.dart';

import 'package:http/http.dart' as http;
import 'package:mmmk_app/repo/userRepository.dart';

const String apiUrl = "";
const String loginUrl = "/login";

Future<void> login(String username, String password) async {
  final String url = apiUrl + loginUrl;
  try {
    final http.Response response = await http.post(
      url,
      body: json.encode({
        "username": username,
        "password": password,
      }),
    );
    Map data = json.decode(response.body);
    print(data);
  } catch (error) {
    // TODO: hibakezelés saját exceptionnel
    throw error;
  }
}
