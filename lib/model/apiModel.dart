class ApiUser{
  String _userName;
  Token _token;

  String get userName => _userName;
  String get token => _token.code;

  ApiUser(this._userName, this._token);
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
