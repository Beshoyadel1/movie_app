import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/api/MovieDetailsApi/ModelDetailsMovie.dart';
import 'package:movie_app/api/MovieDetailsApi/MovieDetailsRepository.dart';
import 'package:movie_app/bloc/MovieDetailsBloc/movie_details_event.dart';
import 'package:movie_app/bloc/MovieDetailsBloc/movie_details_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;

  MovieBloc(this.repository) : super(MovieInitial()) {
    on<FetchMovies>((event, emit) async {
      emit(MovieLoading());
      print("Fetching movies...");
      try {
        final movies = await repository.fetchMovies();
        print("Movies Loaded: ${movies.length}");
        emit(MovieLoaded(movies));
      } catch (e) {
        print(" Bloc Error: $e");
        emit(MovieError(e.toString()));
      }
    });

    on<SaveMovieEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('saved_movie', jsonEncode(event.movie.toJson()));
      emit(MovieLoaded([event.movie]));
    });

    on<LoadMovieEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final movieString = prefs.getString('saved_movie');
      if (movieString != null) {
        final movieData = Movies.fromJson(jsonDecode(movieString));
        emit(MovieLoaded([movieData]));
      } else {
        emit(MovieError("No saved movie found"));
      }
    });
  }
}