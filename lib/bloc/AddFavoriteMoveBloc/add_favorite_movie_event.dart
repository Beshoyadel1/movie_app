import 'package:equatable/equatable.dart';
import 'package:movie_app/api/AddMovieLoveApi/ModelAddMovie.dart';

abstract class FavoriteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddFavoriteMovie extends FavoriteEvent {
  final MovieAddFavourite movie;

  AddFavoriteMovie(this.movie);

  @override
  List<Object> get props => [movie];
}
