class MovieAddFavourite {
  final String movieId;
  final String name;
  final double rating;
  final String imageURL;
  final String year;

  MovieAddFavourite({
    required this.movieId,
    required this.name,
    required this.rating,
    required this.imageURL,
    required this.year,
  });


  Map<String, dynamic> toJson() {
    return {
      'movieId': movieId,
      'name': name,
      'rating': rating,
      'imageURL': imageURL,
      'year': year,
    };
  }
}