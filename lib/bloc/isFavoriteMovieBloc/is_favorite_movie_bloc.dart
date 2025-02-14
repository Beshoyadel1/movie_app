import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/api/IsFavMovie/IsFavMovieRepository.dart';
import 'package:movie_app/bloc/isFavoriteMovieBloc/is_favorite_movie_event.dart';
import 'package:movie_app/bloc/isFavoriteMovieBloc/is_favorite_movie_state.dart';

class IsFavBloc extends Bloc<IsFavEvent, IsFavState> {
  final IsFavMovieRepository repository;

  IsFavBloc(this.repository) : super(IsFavInitialState()) {
    on<CheckFavoriteStatusEvent>(_onCheckFavoriteStatus);
  }

  Future<void> _onCheckFavoriteStatus(
      CheckFavoriteStatusEvent event, Emitter<IsFavState> emit) async {
    emit(IsFavLoadingState());
    try {
      final isFavorite = await repository.checkIsFavorite(event.movieId);
      emit(IsFavSuccessState(isFavorite));
    } catch (e) {
      emit(IsFavErrorState(e.toString()));
    }
  }
}
