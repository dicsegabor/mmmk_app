import 'package:flutter/cupertino.dart';
import 'package:mmmk_app/api/bandsApi.dart';
import 'package:mmmk_app/api/reservationsApi.dart';
import 'package:mmmk_app/api/usersApi.dart';
import 'package:mmmk_app/model/band.dart';
import 'package:mmmk_app/model/reservation.dart';
import 'package:mmmk_app/model/user.dart';

class Repository with ChangeNotifier {
  List<User> _users;
  List<Band> _bands;
  List<Reservation> _reservations;

  Repository() {
    _users = [];
    _bands = [];
    _reservations = [];
  }

  List<User> get users => [..._users];

  List<Band> get bands => [..._bands];

  List<Reservation> get reservations => [..._reservations];

  User getUserByUsername(String username) {
    return _users.firstWhere((element) => element.username == username);
  }

  //TODO: hibakezelés
  //TODO: remove
  Future<void> fetchAndSetAllData(String token) async {
    try {
      //_users = await fetchUsers(token).timeout(Duration(seconds: 10));
      //_bands = await fetchBands(token, _users).timeout(Duration(seconds: 10));
      _reservations = await fetchReservations(token).timeout(Duration(seconds: 10));
    } catch (error) {
      throw error;
    }
    notifyListeners();
  }

  Future<void> fetchAndSetUsers(String token) async {
    _users = await fetchUsers(token);
    notifyListeners();
  }

  Future<void> fetchAndSetBands(String token) async {
    _bands = await fetchBands(token, _users);
    notifyListeners();
  }
}
