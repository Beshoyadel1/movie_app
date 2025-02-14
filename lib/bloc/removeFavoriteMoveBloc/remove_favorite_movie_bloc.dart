
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/api/removeMoveLove/RemoveMoveLove.dart';
import 'package:movie_app/bloc/removeFavoriteMoveBloc/remove_favorite_movie_event.dart';
import 'package:movie_app/bloc/removeFavoriteMoveBloc/remove_favorite_movie_state.dart';

class removeFavoriteBloc extends Bloc<removeFavoriteEvent, removeFavoriteState> {
  final removeFavoriteRepository removefavoriteRepository;

  removeFavoriteBloc(this.removefavoriteRepository) : super(removeFavoriteInitial()) {
    on<removeFavoriteMovie>(_onremoveFavoriteMovie);
  }

  Future<void> _onremoveFavoriteMovie(
      removeFavoriteMovie event, Emitter<removeFavoriteState> emit) async {
    emit(removeFavoriteLoading());
    try {
      final message = await removefavoriteRepository.removeFavorite(event.id);
      emit(removeFavoriteSuccess(message));
    } catch (e) {
      emit(removeFavoriteFailure(e.toString()));
    }
  }
}
