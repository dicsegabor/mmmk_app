import 'dart:async';

import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

Future<void> goToWebsite(String website) async {
  if (await canLaunch(website)) {
    await launch(website);
  } else {
    throw "A kérést nem sikerült végrehajtani.";
  }
}

Future<void> sendEmail(String email) async {
  final mailToLink = Mailto(to: [email]);
  if (await canLaunch("$mailToLink")) {
    await launch("$mailToLink");
  } else {
    throw "A kérést nem sikerült végrehajtani.";
  }
}

Future<void> callPhone(String telephone) async {
  if (await canLaunch("tel://$telephone}")) {
    await launch("tel://$telephone}");
  } else {
    throw "A kérést nem sikerült végrehajtani.";
  }
}

Future<bool> testUrl(String url) async {
  final response = await http.get(url).timeout(Duration(seconds: 3));
  return response.statusCode == 200;
}
