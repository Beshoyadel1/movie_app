import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/UI/Navigationbar/Home/DetailsMove/DetailsMovieScreen.dart';
import 'package:movie_app/UI/Navigationbar/Home/ItemViewMovie.dart';
import 'package:movie_app/api/MovieDetailsApi/ModelDetailsMovie.dart';
import 'package:movie_app/bloc/MovieDetailsBloc/movie_details_bloc.dart';
import 'package:movie_app/bloc/MovieDetailsBloc/movie_details_event.dart';
import 'package:movie_app/bloc/MovieDetailsBloc/movie_details_state.dart';

class MovieGridView extends StatefulWidget {
  const MovieGridView({super.key});

  @override
  State<MovieGridView> createState() => _MovieGridViewState();
}

class _MovieGridViewState extends State<MovieGridView> {
  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(FetchMovies()); // Trigger Bloc event
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
          if (state.movies.isEmpty) {
            return Center(child: Text('No movies available.'));
          }

          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two items per row
              childAspectRatio: 0.7, // Aspect ratio for proper layout
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              return _buildMovieItem(context, state.movies[index]);
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsMovieScreen(
              rate: movie.rating.toString(),
              name: movie.name,
              imageurl: movie.url,
              year: movie.year.toString(),
              title: movie.title,
              descriptionFull: movie.descriptionFull ?? 'No description available.',
              id: movie.id,
              imageBackground: movie.backgroundImageOriginal ?? '',
            ),
          ),
        );
      },
      child: ItemViewMovie(
        widthscreen: 0.45,
        heightscreen: 0.3,
        PathImage: movie.mediumCoverImage ?? '',
        rate: movie.rating.toString(),
      ),
    );
  }
}
