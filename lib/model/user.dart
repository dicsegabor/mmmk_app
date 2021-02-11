import 'package:mailto/mailto.dart';
import 'package:mmmk_app/model/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class User {
  String url;
  String username;
  String lastName;
  String firstName;
  String email;
  Profile profile;

  User(
      {this.url,
      this.username,
      this.lastName,
      this.firstName,
      this.email,
      this.profile});

  String get fullName =>
      lastName != null && firstName != null ? "$lastName $firstName" : "";

  User.empty() {
    url = "";
    username = "";
    lastName = "";
    firstName = "";
    email = "";
    profile = Profile.empty();
  }

  User.fromMap(Map<String, dynamic> data) {
    url = data["url"] ?? "";
    username = data["username"] ?? "";
    lastName = data["last_name"] ?? "";
    firstName = data["first_name"] ?? "";
    email = data["email"] ?? "";
    profile = Profile.empty();
  }

  Map<String, dynamic> toMap() {
    return {
      "url": url ?? "",
      "username": username ?? "",
      "last_name": lastName ?? "",
      "first_name": firstName ?? "",
      "email": email ?? "",
      "profile_url": profile.url ?? "",
    };
  }

  bool contains(String searched) {
    return username.toLowerCase().contains(searched.toLowerCase()) ||
        fullName.toLowerCase().contains(searched.toLowerCase()) ||
        email.toLowerCase().contains(searched.toLowerCase()) ||
        profile.contains(searched);
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
