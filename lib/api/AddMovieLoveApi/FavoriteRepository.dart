import 'dart:convert';

import 'package:movie_app/api/AddMovieLoveApi/ModelAddMovie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FavoriteRepository {
  Future<ModelAddMovie> addMovieToFavorites(String movieId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('auth_token');

    if (token == null) {
      throw Exception("User is not authenticated");
    }

    final response = await http.post(
      Uri.parse("https://route-movie-apis.vercel.app/favorites/add"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({"movieId": movieId}),
    );

    if (response.statusCode == 200) {
      return ModelAddMovie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to add favorite: ${response.body}");
    }
  }
}