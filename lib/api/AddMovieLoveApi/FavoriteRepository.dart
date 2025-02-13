import 'dart:convert';

import 'package:movie_app/api/AddMovieLoveApi/ModelAddMovie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class FavoriteRepository {
  Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("auth_token");
  }

  Future<String> addFavorite(MovieAddFavourite movie) async {
    final token = await getAuthToken();
    if (token == null) throw Exception("User not authenticated");

    final response = await http.post(
      Uri.parse("https://route-movie-apis.vercel.app/favorites/add"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(movie.toJson()),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["message"];
    } else {
      print("Failed to add favorite: ${response.body}");
      throw Exception("Failed to add favorite: ${response.body}");
    }
  }
}
