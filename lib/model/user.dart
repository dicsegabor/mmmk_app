import 'package:mmmk_app/model/profile.dart';

class User {
  String lastName;
  String firstName;
  String email;
  Profile profile;

  User({this.lastName, this.firstName, this.email, this.profile});

  User.fromMap(Map<String, dynamic> data) {
    lastName = data["lastName"];
    firstName = data["firstName"];
    email = data["email"];
    profile = Profile.fromMap(data["profile"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "lastName": lastName,
      "firstName": firstName,
      "email": email,
      "profile": profile.toMap(),
    };
  }
}
