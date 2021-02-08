import 'package:mmmk_app/model/user.dart';

class Band {
  String name;
  String description;
  List<User> members;
  String logoUrl;
  String contactEmail;
  String website;

  Band({
    this.name,
    this.description,
    this.members,
    this.logoUrl,
    this.contactEmail,
    this.website,
  });

  //TODO: konverziót megjavítani
  Band.fromMap(Map<String, dynamic> data){
    name = data["name"];
    description = data["description"];
    members = data["members"];
    logoUrl = data["logoUrl"];
    contactEmail = data["contactEmail"];
    website = data["website"];
  }

  Map<String, dynamic> toMap(){
    return {
      "name": name,
      "description": description,
      "members": members,
      "logoUrl": logoUrl,
      "contactEmail": contactEmail,
      "website": website,
    };
  }
}
