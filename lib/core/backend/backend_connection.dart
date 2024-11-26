import 'dart:convert';
import 'package:http/http.dart' as http;

class BackendConnection {
  final String backendUrl = 'https://f3eb-179-49-254-167.ngrok-free.app';

  Future<http.Response> get(String url, Map<String, String> queryParams) {
    final uri = Uri.parse('$backendUrl$url').replace(queryParameters: queryParams);
    return http.get(uri);
  }

  Future<http.Response> post(String url, Map<String, dynamic> body) {
    return http.post(
      Uri.parse('$backendUrl$url'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
  }

  Future<String?> createUser(String email, String password) async {
    try {
      final response = await post('/users', {'email': email, 'password': password});

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print('Failed to create user: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error creating user: $e');
      return null;
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      final response = await get('/login', {'email': email, 'password': password});

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print('Failed to login: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error logging in: $e');
      return null;
    }
  }
}
