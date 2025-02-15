import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/UI/Navigationbar/Home/DetailsMove/DetailsMovieScreen.dart';
import 'package:movie_app/UI/Navigationbar/Home/ItemViewMovie.dart';
import 'package:movie_app/api/MovieDetailsApi/ModelDetailsMovie.dart';
import 'package:movie_app/bloc/MovieDetailsBloc/movie_details_bloc.dart';
import 'package:movie_app/bloc/MovieDetailsBloc/movie_details_event.dart';
import 'package:movie_app/bloc/MovieDetailsBloc/movie_details_state.dart';
import 'package:movie_app/bloc/isFavoriteMovieBloc/is_favorite_movie_bloc.dart';
import 'package:movie_app/bloc/isFavoriteMovieBloc/is_favorite_movie_event.dart';
import 'package:movie_app/bloc/isFavoriteMovieBloc/is_favorite_movie_state.dart';

class MovieGridView extends StatefulWidget {
  final String? filterGenre;
  final String? searchQuery;

  const MovieGridView({super.key, this.filterGenre, this.searchQuery});

  @override
  State<MovieGridView> createState() => _MovieGridViewState();
}

class _MovieGridViewState extends State<MovieGridView> {
  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(FetchMovies());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MovieError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is MovieLoaded) {
          var filteredMovies = state.movies.where((movie) {
            bool matchesGenre = widget.filterGenre == null ||
                movie.genres.contains(widget.filterGenre);
            bool matchesSearch = widget.searchQuery == null ||
                movie.title.toLowerCase().contains(widget.searchQuery!.toLowerCase());
            return matchesGenre && matchesSearch;
          }).toList();

          if (filteredMovies.isEmpty) {
            return Center(child: Text('No movies found.'));
          }

          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: filteredMovies.length,
            itemBuilder: (context, index) {
              return _buildMovieItem(context, filteredMovies[index]);
            },
          );
        }
        return Center(child: Text('Unexpected state.'));
      },
    );
  }

  Widget _buildMovieItem(BuildContext context, Movies movie) {
    return InkWell(
      onTap: () {
        context.read<IsFavBloc>().add(CheckFavoriteStatusEvent(movie.id.toString()));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocListener<IsFavBloc, IsFavState>(
              listener: (context, state) {
                if (state is IsFavSuccessState) {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsMovieScreen(
                        imageurl: movie.url,
                        year: movie.year.toString(),
                        rate: movie.rating.toString(),
                        title: movie.title.toString(),
                        descriptionFull: movie.descriptionFull.toString(),
                        id: movie.id,
                        imageBackground: movie.mediumCoverImage.toString(),
                        isSelect: state.isFavorite,
                      ),
                    ),
                  );
                }
              },
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
        );
      },
      child: ItemViewMovie(
        widthscreen: 0.5,
        heightscreen: 0.35,
        PathImage: movie.mediumCoverImage ?? '',
        rate: movie.rating.toString(),
      ),
    );
  }
}
