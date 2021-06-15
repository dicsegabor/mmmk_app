import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mmmk_app/api/apiUrls.dart';

Future<String> login(String username, String password) async {
  try {
    final http.Response response = await http.post(
      loginUrl,
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({
        "username": username,
        "password": password,
      }),
    );
    if (response.statusCode != 200)
      throw HttpException(json.decode(utf8.decode(response.bodyBytes)));

    return json.decode(response.body)["token"];
  } catch (error) {
    throw error;
  }
}
