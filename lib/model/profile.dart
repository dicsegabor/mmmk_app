class Profile {
  String url;
  String telephone;
  String dormitory;
  String room;
  String faculty;
  bool firstReservation;
  bool isHidden;

  Profile({
    this.url,
    this.telephone,
    this.dormitory,
    this.room,
    this.faculty,
    this.firstReservation,
    this.isHidden,
  });

  Profile.empty() {
    url = "";
    telephone = "";
    dormitory = "";
    room = "";
    faculty = "";
    firstReservation = true;
    isHidden = false;
  }

  Profile.fromMap(Map<String, dynamic> data) {
    url = data["url"] ?? "";
    telephone = data["telephone"] ?? "";
    dormitory = data["dormitory"] ?? "";
    room = data["room"] == null ? "" : data["room"].toString();
    faculty = data["faculty"] ?? "";
    firstReservation = data["firstReservation"] ?? true;
    isHidden = data["isHidden"] ?? false;
  }

  Map<String, dynamic> toMap() {
    return {
      "url": url ?? "",
      "telephone": telephone ?? "",
      "dormitory": dormitory ?? "",
      "room": room ?? "",
      "faculty": faculty ?? "",
      "firstReservation": firstReservation ?? true,
      "isHidden": isHidden ?? false,
    };
  }

  bool contains(String searched) {
    return telephone.toLowerCase().contains(searched.toLowerCase()) ||
        dormitory.toLowerCase().contains(searched.toLowerCase()) ||
        room.toString().toLowerCase().contains(searched.toLowerCase()) ||
        faculty.toLowerCase().contains(searched.toLowerCase());
  }
}
