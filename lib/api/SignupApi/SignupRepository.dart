import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/api/ApiValue.dart';
import 'package:movie_app/api/SignupApi/ModelSignup.dart';

class SignupRepository {
  Future<SignupResponse> signup(
      String name, String email, String phone, String password, String confirmPassword, int avaterId) async {
    final url = Uri.parse('${ApiValue.baseUrl}/auth/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'confirmPassword': confirmPassword,
        'avaterId': avaterId
      }),
    );

    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return SignupResponse.fromJson(responseBody);
    } else {
      throw Exception(responseBody['message'] ?? 'Signup failed');
    }
  }
}