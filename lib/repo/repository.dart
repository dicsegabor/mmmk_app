import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mmmk_app/api/UserAgentClient.dart';
import 'package:mmmk_app/api/bandsApi.dart';
import 'package:mmmk_app/api/reservationsApi.dart';
import 'package:mmmk_app/api/usersApi.dart';
import 'package:mmmk_app/model/band.dart';
import 'package:mmmk_app/model/reservation.dart';
import 'package:mmmk_app/model/user.dart';

class Repository with ChangeNotifier {
  List<User> _users;
  List<Band> _bands;
  Map<int, List<Reservation>> _reservations;

  Repository() {
    _users = [];
    _bands = [];
    _reservations = {};
  }

  List<User> get users => [..._users];

  List<Band> get bands => [..._bands];

  Map<int, List<Reservation>> get reservations => _reservations;

  User getUserByUsername(String username) {
    try {
      return _users.firstWhere((element) => element.username == username);
    } catch (error) {
      return null;
    }
  }

  //TODO: hibakezelés
  //TODO: remove
  Future<void> fetchAndSetAllData(UserAgentClient userAgentClient) async {
    try {
      _users = await fetchUsers(userAgentClient).timeout(Duration(seconds: 5));
      _bands = await fetchBands(userAgentClient, _users)
          .timeout(Duration(seconds: 5));
      _reservations = await fetchReservations(userAgentClient)
          .timeout(Duration(seconds: 5));
    } catch (error) {
      throw error;
    }
    notifyListeners();
  }

  Future<void> fetchAndSetUsers(UserAgentClient userAgentClient) async {
    _users = await fetchUsers(userAgentClient);
    notifyListeners();
  }

  Future<void> fetchAndSetBands(UserAgentClient userAgentClient) async {
    _bands = await fetchBands(userAgentClient, _users);
    notifyListeners();
  }
}
