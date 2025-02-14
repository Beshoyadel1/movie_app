import 'dart:convert';
import 'package:movie_app/api/ApiValue.dart';
import 'package:http/http.dart' as http;
class IsFavMovieRepository {
  Future<bool> checkIsFavorite(String id) async {
    final token = await ApiValue.getAuthToken();
    if (token == null) throw Exception("User not authenticated");

    final response = await http.get(
      Uri.parse("${ApiValue.baseUrl}/favorites/is-favorite/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData["data"] is bool) {
        return jsonData["data"]; // Return the boolean directly
      } else {
        throw Exception("Invalid response format");
      }
    } else {
      print("Failed to check favorite status: ${response.body}");
      throw Exception("Failed to check favorite status: ${response.body}");
    }
  }
}
