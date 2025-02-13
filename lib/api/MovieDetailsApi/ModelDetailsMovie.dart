class Movies {
  final int id;
  final String title;
  final String url;
  final int year;
  final double rating;
  final String mediumCoverImage;
  final String backgroundImageOriginal;
  final String descriptionFull;
  final List<String> genres;

  Movies({
    required this.id,
    required this.url,
    required this.year,
    required this.title,
    required this.rating,
    required this.mediumCoverImage,
    required this.backgroundImageOriginal,
    required this.descriptionFull,
    required this.genres,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      year: json['year'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      mediumCoverImage: json['medium_cover_image'] ?? '',
      backgroundImageOriginal: json['background_image_original'] ?? '',
      descriptionFull: json['description_full'] ?? '',
      genres: (json['genres'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'rating': rating,
      'medium_cover_image': mediumCoverImage,
      'background_image_original': backgroundImageOriginal,
      'description_full': descriptionFull,
      'genres': genres,
    };
  }
}
