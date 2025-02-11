import 'package:flutter/material.dart';
import 'package:movie_app/UI/Navigationbar/Home/DetailsMove/DetailsMovieScreen.dart';
import 'package:movie_app/UI/Navigationbar/Home/ItemViewMovie.dart';
import 'package:movie_app/UI/custom%20widget/MovieList.dart';

class MovieGridView extends StatelessWidget {
  const MovieGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // Disables scrolling inside another scrollable widget
      itemCount: (MovieList.movies.length / 2).ceil(), // Ensures correct row count
      itemBuilder: (context, index) {
        int firstMovieIndex = index * 2;
        int secondMovieIndex = firstMovieIndex + 1;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMovieItem(context, firstMovieIndex),
              if (secondMovieIndex < MovieList.movies.length)
                _buildMovieItem(context, secondMovieIndex)
            ],
          ),
        );
      },
    );
  }

  Widget _buildMovieItem(BuildContext context, int index) {
    var movie = MovieList.movies[index];
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsMovieScreen(
                imageBackground: movie["image"],
              ),
            ),
          );
        },
        child: ItemViewMovie(
          widthscreen: 0.45,
          heightscreen: 0.3,
          PathImage: movie["image"],
          rate: movie["rating"],
        ),
      ),
    );
  }
}
