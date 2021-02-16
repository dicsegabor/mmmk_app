import 'package:mmmk_app/model/profile.dart';

import 'interfaces/searchable.dart';

class User implements Searchable{
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

  String get fullName => firstName.isEmpty && lastName.isEmpty
      ? "Nincs Nevem"
      : "$lastName $firstName";

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
}
