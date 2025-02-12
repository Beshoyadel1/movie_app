import 'package:equatable/equatable.dart';

abstract class AddFavoriteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddMovieToFavorites extends AddFavoriteEvent {
  final String movieId;

  AddMovieToFavorites({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}