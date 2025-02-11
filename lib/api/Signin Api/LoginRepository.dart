//LoginRepository

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:movie_app/api/ApiValue.dart';
import 'package:movie_app/api/Signin%20Api/ModelSignin.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginRepository{
  Future<SigninResponse?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("${ApiValue.baseUrl}/auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      if (jsonData.containsKey('message') && jsonData.containsKey('data')) {
        final signinResponse = SigninResponse.fromJson(jsonData);

        if (signinResponse.token != null) {
          return signinResponse; // ✅ Return token, don't store in SharedPreferences
        }
      }
    }
    return null; // Return null if login fails
  }
  Future<bool> deleteAccount(String token) async {
    final response = await http.delete(
      Uri.parse("${ApiValue.baseUrl}/profile"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> resetPassword(String token, String oldPassword, String newPassword) async {
    final response = await http.patch(
      Uri.parse("${ApiValue.baseUrl}/auth/reset-password"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      }),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData["message"] == "Password updated successfully";
    } else {
      return false;
    }
  }
}
