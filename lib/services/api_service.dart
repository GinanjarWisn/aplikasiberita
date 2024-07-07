import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey = 'be84f6a2ac4843c3be785b353cf7b90d';
  static const String baseUrl = 'https://newsapi.org/v2';

  static Future<bool> signup({
    required String username,
    required String fullName,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    final String signupUrl = '$baseUrl/signup';

    final response = await http.post(
      Uri.parse(signupUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'username': username,
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
