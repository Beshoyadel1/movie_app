import 'dart:convert';

import 'package:movie_app/api/MovieDetailsApi/ModelDetailsMovie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  final String apiUrl = "https://yts.mx/api/v2/list_movies.json?quality=3D";

  Future<List<Movies>> fetchMovies() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('auth_token');
    print(" Auth Token Retrieved: $token");

    if (token == null || token.isEmpty) {
      throw Exception(" Auth token is missing! Please log in again.");
    }

    final response = await http.get(Uri.parse(apiUrl), headers: {
      'Authorization': 'Bearer $token',
    });

    print(" Response Status Code: ${response.statusCode}");
    print(" Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final moviesJson = jsonResponse['data']['movies'] as List;
      return moviesJson.map((movie) => Movies.fromJson(movie)).toList();
    } else {
      throw Exception('API Error: ${response.statusCode}');
    }
  }

}