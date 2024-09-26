import 'package:http/http.dart' as http;

class CookieManager {
  Map<String, String> _cookies = {};

  void setCookie(String name, String value) {
    _cookies[name] = value;
  }

  String? getCookie(String name) {
    return _cookies[name];
  }

  Map<String, String> getCookies() {
    return _cookies;
  }

  Future<http.Response> get(String url) async {
    var response = await http.get(Uri.parse(url), headers: _buildHeaders());
    return response;
  }

  Future<http.Response> post(String url, {Map<String, String>? body}) async {
    var response = await http.post(Uri.parse(url), headers: _buildHeaders(), body: body);
    return response;
  }

  Map<String, String> _buildHeaders() {
    return {
      'Cookie': _cookies.entries.map((e) => '${e.key}=${e.value}').join('; '),
    };
  }
}
