import 'package:http/http.dart' as http;

class UserAgentClient extends http.BaseClient {
  final String _token;
  final http.Client _inner;

  UserAgentClient(this._token, this._inner);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Authorization'] = _token;
    return _inner.send(request);
  }
}
