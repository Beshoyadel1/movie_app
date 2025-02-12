import 'package:movie_app/assets/ImagePath.dart';

class MovieList {
  static List<Map<String, dynamic>> movies = [
    {"image": ImagePath.film1, "rating": "7.7"},
    {"image": ImagePath.film2, "rating": "8.2"},
    {"image": ImagePath.film3, "rating": "9.9"},
    {"image": ImagePath.film4, "rating": "5.7"},
    {"image": ImagePath.film5, "rating": "2.2"},
    {"image": ImagePath.film6, "rating": "6.3"},
    {"image": ImagePath.film7, "rating": "7.8"},
    {"image": ImagePath.film8, "rating": "8.2"},
    {"image": ImagePath.film9, "rating": "3.9"},
    {"image": ImagePath.film10, "rating": "7.5"},
    {"image": ImagePath.film11, "rating": "6.2"},
    {"image": ImagePath.film12, "rating": "2.8"},
  ];
  static List<String>MoviesListTypes=[
    'Action',
    'Adventure',
    'Animation',
    'Biography',
    "Drama",
    "Horror",
    "Romance",
    "Thriller"
    "Animation",
    "Comedy",
    "Fantasy",
    "Horror",
    "Documentary",
    "Music"
  ];
}
