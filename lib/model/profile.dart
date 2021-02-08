class Profile {
  String telephone;
  String dormitory;
  int room;
  String faculty;
  bool firstReservation;
  bool isHidden;

  Profile({
    this.telephone,
    this.dormitory,
    this.room,
    this.faculty,
    this.firstReservation,
    this.isHidden,
  });

  Profile.fromMap(Map<String, dynamic> data) {
    telephone = data["telephone"];
    dormitory = data["dormitory"];
    room = data["room"];
    faculty = data["faculty"];
    firstReservation = data["firstReservation"];
    isHidden = data["isHidden"];
  }

  Map<String, dynamic> toMap() {
    return {
      "telephone": telephone,
      "dormitory": dormitory,
      "room": room,
      "faculty": faculty,
      "firstReservation": firstReservation,
      "isHidden": isHidden,
    };
  }
}
