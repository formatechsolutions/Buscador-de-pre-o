import 'dart:async';
import 'package:http/http.dart' as http;

class BackendConnection {
  final String backendUrl = 'http://localhost:3000';

  Future<http.Response> get(String url) =>
      http.get(Uri.parse('$backendUrl$url'));

  Future<http.Response> post(String url, Map<String, dynamic> body) =>
      http.post(Uri.parse('$backendUrl$url'), body: body);

  Future createUser(String email, String password) async {
    final response =
        await post('/users', {'email': email, 'password': password});

    if (response.statusCode == 200) {
      return response.body;
    }
  }
}
