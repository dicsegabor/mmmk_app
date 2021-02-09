import 'package:mailto/mailto.dart';
import 'package:mmmk_app/model/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class User {
  String username;
  String lastName;
  String firstName;
  String email;
  Profile profile;

  User({this.username, this.lastName, this.firstName, this.email, this.profile});

  String get fullName => "$lastName $firstName";

  User.fromMap(Map<String, dynamic> data) {
    username = data["username"];
    lastName = data["lastName"];
    firstName = data["firstName"];
    email = data["email"];
    profile = Profile.fromMap(data["profile"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "lastName": lastName,
      "firstName": firstName,
      "email": email,
      "profile": profile.toMap(),
    };
  }

  Future<void> sendEmail() async {
    final mailToLink = Mailto(to: [email]);
    if (await canLaunch("$mailToLink")) {
      await launch("$mailToLink");
    } else {
      throw "A kérést nem sikerült végrehajtani.";
    }
  }

  Future<void> callPhone() async {
    if (await canLaunch("tel://${profile.telephone}")) {
      await launch("tel://${profile.telephone}");
    } else {
      throw "A kérést nem sikerült végrehajtani.";
    }
  }
}
