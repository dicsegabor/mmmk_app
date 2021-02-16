import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/Dell/Google%20Drive/Programming/Flutter/mmmk_app/lib/model/interfaces/searchable.dart';

class Band implements Searchable{
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
}
