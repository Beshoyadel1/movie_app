import 'package:equatable/equatable.dart';
import 'package:movie_app/api/AddMovieLoveApi/ModelAddMovie.dart';

abstract class removeFavoriteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class removeFavoriteMovie extends removeFavoriteEvent {
  final String id;
  removeFavoriteMovie(this.id);

  @override
  List<Object> get props => [id];
}
