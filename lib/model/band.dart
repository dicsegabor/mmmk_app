import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class Band {
  String name;
  String description;
  List<String> members = [];
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

  Band.fromMap(Map<String, dynamic> data){
    name = data["name"] ?? "";
    description = data["description"] ?? "";
    logoUrl = data["logoUrl"] ?? "";
    contactEmail = data["contactemail"] ?? "";
    website = data["website"] ?? "";
  }

  Map<String, dynamic> toMap(){
    return {
      "name": name ?? "",
      "description": description ?? "",
      "members": members,
      "logoUrl": logoUrl ?? "",
      "contactemail": contactEmail ?? "",
      "website": website ?? "",
    };
  }

  bool contains(String searched){
    return name.toLowerCase().contains(searched.toLowerCase()) ||
        contactEmail.toLowerCase().contains(searched.toLowerCase());
  }

  Future<void> goToWebsite() async {
    if (await canLaunch(website)) {
      await launch(website);
    } else {
      throw "A kérést nem sikerült végrehajtani.";
    }
  }

  Future<void> sendEmail() async {
    final mailToLink = Mailto(to: [contactEmail]);
    if (await canLaunch("$mailToLink")) {
      await launch("$mailToLink");
    } else {
      throw "A kérést nem sikerült végrehajtani.";
    }
  }
}
