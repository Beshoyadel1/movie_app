import 'dart:convert';
import 'package:movie_app/api/ApiValue.dart';
import 'package:movie_app/api/ProfileApi/ModelProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileRepository {
  Future<ProfileResponse?> fetchUserProfile() async {
    final token = await ApiValue.getAuthToken();
    if (token == null) throw Exception("User not authenticated");

    final response = await http.get(
      Uri.parse("${ApiValue.baseUrl}/profile"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ProfileResponse.fromJson(jsonData);
    }
    return null;
  }

  Future<bool> updateProfile({String? name, String? phone, int? avatarId}) async {
    final token = await ApiValue.getAuthToken();
    if (token == null) throw Exception("User not authenticated");

    final response = await http.patch(
      Uri.parse("${ApiValue.baseUrl}/profile"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "name": name,
        "phone": phone,
        "avaterId": avatarId,
      }),
    );

    print("Update Profile Response Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    return response.statusCode == 200;
  }
}
