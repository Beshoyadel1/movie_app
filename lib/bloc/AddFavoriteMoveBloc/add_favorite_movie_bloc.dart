import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/api/AddMovieLoveApi/ModelAddMovie.dart';
import 'package:movie_app/api/AddMovieLoveApi/FavoriteRepository.dart';
import 'package:movie_app/bloc/AddFavoriteMoveBloc/add_favorite_movie_event.dart';
import 'package:movie_app/bloc/AddFavoriteMoveBloc/add_favorite_movie_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository favoriteRepository;

  FavoriteBloc(this.favoriteRepository) : super(FavoriteInitial()) {
    on<AddFavoriteMovie>(_onAddFavoriteMovie);
  }

  Future<void> _onAddFavoriteMovie(
      AddFavoriteMovie event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {
      final message = await favoriteRepository.addFavorite(event.movie);
      emit(FavoriteSuccess(message));
    } catch (e) {
      emit(FavoriteFailure(e.toString()));
    }
  }
}
