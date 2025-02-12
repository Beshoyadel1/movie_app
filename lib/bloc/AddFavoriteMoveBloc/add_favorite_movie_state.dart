import 'package:equatable/equatable.dart';
import 'package:movie_app/api/AddMovieLoveApi/ModelAddMovie.dart';

abstract class AddFavoriteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddFavoriteInitial extends AddFavoriteState {}

class AddFavoriteLoading extends AddFavoriteState {}

class AddFavoriteSuccess extends AddFavoriteState {
  final ModelAddMovie response;
  AddFavoriteSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class AddFavoriteFailure extends AddFavoriteState {
  final String error;
  AddFavoriteFailure(this.error);

  @override
  List<Object?> get props => [error];
}
