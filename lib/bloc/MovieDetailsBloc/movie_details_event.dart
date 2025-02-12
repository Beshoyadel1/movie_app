import 'package:equatable/equatable.dart';
import 'package:movie_app/api/MovieDetailsApi/ModelDetailsMovie.dart';

abstract class MovieEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMovies extends MovieEvent {}

class SaveMovieEvent extends MovieEvent {
  final Movies movie;
  SaveMovieEvent(this.movie);

  @override
  List<Object?> get props => [movie];
}

class LoadMovieEvent extends MovieEvent {}