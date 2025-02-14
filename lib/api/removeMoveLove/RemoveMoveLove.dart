import 'dart:convert';
import 'package:movie_app/api/ApiValue.dart';
import 'package:http/http.dart' as http;
class removeFavoriteRepository {
  Future<String> removeFavorite(String id) async {
    final token = await ApiValue.getAuthToken();
    if (token == null) throw Exception("User not authenticated");

    final response = await http.delete(
      Uri.parse("${ApiValue.baseUrl}/favorites/remove/${id}"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["message"];
    } else {
      print("Failed to remove favorite: ${response.body}");
      throw Exception("Failed to add favorite: ${response.body}");
    }
  }
}
