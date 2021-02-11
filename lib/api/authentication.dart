import 'dart:convert';

import 'package:mmmk_app/api/apiUrls.dart';
import 'package:mmmk_app/model/apiModel.dart';

import 'package:http/http.dart' as http;
import 'package:mmmk_app/repo/repository.dart';

Future<void> login(String username, String password) async {
  try {
    final http.Response response = await http.post(
      loginUrl,
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
