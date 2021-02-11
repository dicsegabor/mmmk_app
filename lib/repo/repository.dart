import 'package:mmmk_app/api/bandsApi.dart';
import 'package:mmmk_app/api/usersApi.dart';
import 'package:mmmk_app/model/band.dart';
import 'package:mmmk_app/model/user.dart';

class Repository {
  List<User> _users;
  List<Band> _bands;

  Repository(){
    _users = [];
    _bands = [];
  }

  List<User> get users => [..._users];
  List<Band> get bands => [..._bands];

  Future<void> fetchAndSetData(String token) async {
    _users = await fetchUsers(token);
    _bands = await fetchBands(token, _users);
  }
}