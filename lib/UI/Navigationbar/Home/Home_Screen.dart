import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/UI/Navigationbar/Home/DetailsMove/DetailsMovieScreen.dart';
import 'package:movie_app/UI/Navigationbar/Home/ItemViewMovie.dart';
import 'package:movie_app/api/MovieDetailsApi/ModelDetailsMovie.dart';
import 'package:movie_app/bloc/MovieDetailsBloc/movie_details_bloc.dart';
import 'package:movie_app/bloc/MovieDetailsBloc/movie_details_event.dart';
import 'package:movie_app/bloc/MovieDetailsBloc/movie_details_state.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:movie_app/bloc/isFavoriteMovieBloc/is_favorite_movie_bloc.dart';
import 'package:movie_app/bloc/isFavoriteMovieBloc/is_favorite_movie_event.dart';
import 'package:movie_app/bloc/isFavoriteMovieBloc/is_favorite_movie_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random _random = Random();
  List<Movies> randomMovies = [];

  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(FetchMovies());
  }

  void _getRandomMovies(List<Movies> movies) {
    if (movies.length < 3) {
      randomMovies = movies;
    } else {
      randomMovies = List.from(movies)..shuffle(_random);
      randomMovies = randomMovies.take(3).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePath.home_background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height * 0.03),
                Image.asset(ImagePath.AvailableNow),
                SizedBox(height: height * 0.03),
                BlocBuilder<MovieBloc, MovieState>(
                  builder: (context, state) {
                    if (state is MovieLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is MovieError) {
                      return Center(
                        child: Text(
                          'Error: ${state.message}',
                          style: Fontspath.w400Inter20(color: AppColors.whitecolor),
                        ),
                      );
                    } else if (state is MovieLoaded) {
                      if (state.movies.isEmpty) {
                        return Center(
                          child: Text(
                            'No movies available.',
                            style: Fontspath.w400Inter20(color: AppColors.whitecolor),
                          ),
                        );
                      }
                      _getRandomMovies(state.movies);
                      return Column(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: height * 0.4,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 0.6,
                            ),
                            items: state.movies.map((movie) {
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
                            }).toList(),
                          ),
                          SizedBox(height: height * 0.02),
                          Image.asset(ImagePath.watchnow),
                          SizedBox(height: height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: randomMovies.map((movie) {
                              return Expanded(
                                child: InkWell(
                                  onTap: () {
                                    context.read<IsFavBloc>().add(CheckFavoriteStatusEvent(movie.id.toString()));
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
                                          isSelect: false,
                                        ),
                                      ),
                                    );
                                  },
                                  child: ItemViewMovie(
                                    widthscreen: 0.3,
                                    heightscreen: 0.2,
                                    PathImage: movie.mediumCoverImage ?? '',
                                    rate: movie.rating.toString(),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
