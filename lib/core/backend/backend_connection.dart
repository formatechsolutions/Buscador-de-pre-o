import 'dart:convert';
import 'package:http/http.dart' as http;

class BackendConnection {
  final String backendUrl = 'https://1845-179-49-254-167.ngrok-free.app/api';
  final String backendUrlRender = 'https://buscapreco-backend.onrender.com/api';

  Future<http.Response?> _tryRequest(
      Future<http.Response> Function(String url) request, String url) async {
    
    try {
      return await request(backendUrl + url);
    } catch (e) {
      print('Primary backend failed: $e');
      try {
        return await request(backendUrlRender + url);
      } catch (e) {
        print('Fallback backend also failed: $e');
        return null;
      }
    }
  }

  Future<http.Response?> get(String url, Map<String, String> queryParams) {
    return _tryRequest((baseUrl) async {
      final uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);
      return http.get(uri);
    }, url);
  }

  Future<http.Response?> post(String url, Map<String, dynamic> body) {
    return _tryRequest((baseUrl) async {
      return http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
    }, url);
  }

  Future<String?> createUser(String email, String password) async {
    final response = await post('/users', {'email': email, 'password': password});
    if (response != null && response.statusCode == 200) {
      return response.body;
    } else {
      print('Failed to create user: ${response?.statusCode ?? 'No response'}');
      return null;
    }
  }

  Future<String?> login(String email, String password) async {
    final response = await get('/login', {'email': email, 'password': password});
    if (response != null && response.statusCode == 200) {
      return response.body;
    } else {
      print('Failed to login: ${response?.statusCode ?? 'No response'}');
      return null;
    }
  }

  Future<void> sendEmailResetPassword(String email, String token) async {
    final response = await post('/send-email', {'email': email, 'token': token});

    if (response != null && response.statusCode == 200) {
      print('Email sent successfully');
    } else {
      print('Failed to send email: ${response?.statusCode ?? 'No response'}');
    }
  }

  Future<bool> checkTokenExists(String token) async {
    final response = await get('/checktoken-resetpass', {'token': token});
    return response != null && response.statusCode == 200;
  }
}
