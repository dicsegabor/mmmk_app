class Token {
  String _token;
  DateTime _expiryDate;

  String get token {
    if (_expiryDate.isAfter(DateTime.now())) return _token;
    return null;
  }

  bool isValid() => _expiryDate.isAfter(DateTime.now());

  Token(this._token, Duration expiresIn) {
    _expiryDate = DateTime.now().add(expiresIn);
  }

  factory Token.fromMap(Map<String, dynamic> data) =>
      Token(data["token"], Duration(seconds: data["expiry"]));
}
