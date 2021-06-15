import 'package:http/http.dart' as http;
import 'package:mmmk_app/api/UserAgentClient.dart';
import 'package:mmmk_app/model/user.dart';

class ApiUser {
  String _userName;
  Token _token;
  UserAgentClient _userAgentClient;

  String get username => _userName;

  UserAgentClient get userAgentClient => _userAgentClient;

  ApiUser(this._userName, this._token) {
    _userAgentClient = UserAgentClient(_token.code, http.Client());
  }
}

class Token {
  String _code;
  DateTime _expiryDate;

  String get code {
    if (_expiryDate.isAfter(DateTime.now())) return _code;
    return null;
  }

  bool isValid() => _expiryDate.isAfter(DateTime.now());

  Token(this._code, Duration expiresIn) {
    _expiryDate = DateTime.now().add(expiresIn);
  }

  factory Token.fromMap(Map<String, dynamic> data) =>
      Token(data["token"], Duration(seconds: data["expiry"]));
}
