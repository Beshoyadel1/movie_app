import 'package:equatable/equatable.dart';
import 'package:movie_app/api/MovieDetailsApi/ModelDetailsMovie.dart';

abstract class MovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movies> movies;
  MovieLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class MovieError extends MovieState {
  final String message;
  MovieError(this.message);

  @override
  List<Object?> get props => [message];
}
