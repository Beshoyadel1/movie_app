//LoginRepository

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:movie_app/api/ApiValue.dart';
import 'package:movie_app/api/Signin%20Api/ModelSignin.dart';
class LoginRepository{
  Future<SigninResponse> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("${ApiValue.baseUrl}/auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      if (jsonData.containsKey('message')) {
        return SigninResponse.fromJson(jsonData);
      } else {
        return SigninResponse(message: "Unknown response from server");
      }
    } else {
      return SigninResponse(message: "Invalid credentials");
    }
  }
  Future<bool> deleteAccount(String token) async {
    final response = await http.delete(
      Uri.parse("https://route-movie-apis.vercel.app/profile"),
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
}
