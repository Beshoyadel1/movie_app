import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/api/AddMovieLoveApi/FavoriteRepository.dart';
import 'package:movie_app/bloc/AddFavoriteMoveBloc/add_favorite_movie_event.dart';
import 'package:movie_app/bloc/AddFavoriteMoveBloc/add_favorite_movie_state.dart';

class AddFavoriteBloc extends Bloc<AddFavoriteEvent, AddFavoriteState> {
  final FavoriteRepository repository;

  AddFavoriteBloc(this.repository) : super(AddFavoriteInitial()) {
    on<AddMovieToFavorites>(_onAddMovieToFavorites);
  }

  Future<void> _onAddMovieToFavorites(
      AddMovieToFavorites event, Emitter<AddFavoriteState> emit) async {
    emit(AddFavoriteLoading());

    try {
      final response = await repository.addMovieToFavorites(event.movieId);
      emit(AddFavoriteSuccess(response));
    } catch (error) {
      emit(AddFavoriteFailure(error.toString()));
    }
  }
}