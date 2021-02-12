import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

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