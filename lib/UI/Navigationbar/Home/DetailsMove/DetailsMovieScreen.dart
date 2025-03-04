import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/isFavoriteMovieBloc/is_favorite_movie_bloc.dart';
import 'package:movie_app/bloc/isFavoriteMovieBloc/is_favorite_movie_event.dart';
import 'package:movie_app/bloc/isFavoriteMovieBloc/is_favorite_movie_state.dart';
import 'package:movie_app/bloc/removeFavoriteMoveBloc/remove_favorite_movie_bloc.dart';
import 'package:movie_app/bloc/removeFavoriteMoveBloc/remove_favorite_movie_event.dart';
import 'package:movie_app/bloc/removeFavoriteMoveBloc/remove_favorite_movie_state.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/bloc/AddFavoriteMoveBloc/add_favorite_movie_bloc.dart';
import 'package:movie_app/bloc/AddFavoriteMoveBloc/add_favorite_movie_event.dart';
import 'package:movie_app/bloc/AddFavoriteMoveBloc/add_favorite_movie_state.dart';
import 'package:movie_app/UI/Navigationbar/Home/DetailsMove/ListViewRate.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:movie_app/api/AddMovieLoveApi/ModelAddMovie.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsMovieScreen extends StatefulWidget {
  static const String routeName = 'DetailsMovieScreen';

  final String imageBackground, rate, title, descriptionFull, imageurl, year;
  final int id;
  bool isSelect;
   DetailsMovieScreen({
    required this.imageBackground,
    required this.rate,
    required this.id,
    required this.title,
    required this.descriptionFull,
    required this.imageurl,
    required this.year,
     required this.isSelect,
   });

  @override
  State<DetailsMovieScreen> createState() => _DetailsMovieScreenState();
}

class _DetailsMovieScreenState extends State<DetailsMovieScreen> {
  @override
  Widget build(BuildContext context) {
    MovieAddFavourite movie = MovieAddFavourite(
      movieId: widget.id.toString(),
      name: widget.title,
      rating: double.parse(widget.rate),
      imageURL: widget.imageurl,
      year: widget.year,
    );
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    @override
    void initState() {
      super.initState();
      context.read<IsFavBloc>().add(CheckFavoriteStatusEvent(widget.id.toString()));
    }
    Future<void> _launchURL(String url) async {
      Uri uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        print("Could not launch $url");
        throw Exception("Could not launch $url");
      }
    }


    return MultiBlocListener(
      listeners: [
        BlocListener<FavoriteBloc, FavoriteState>(
          listener: (context, state) {
            if (state is FavoriteSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is FavoriteFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error: ${state.error}")),
              );
            }
          },
        ),
        BlocListener<removeFavoriteBloc, removeFavoriteState>(
          listener: (context, state) {
            if (state is removeFavoriteSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is removeFavoriteFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error: ${state.error}")),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: AppColors.whitecolor,
          ),
          actions: [
            BlocConsumer<IsFavBloc, IsFavState>(
              listener: (context, state) {
                if (state is IsFavSuccessState) {
                  print("Favorite status updated: ${state.isFavorite}");
                }
              },
              builder: (context, state) {
                bool isFavorite = false;
                if (state is IsFavSuccessState) {
                  isFavorite = state.isFavorite;
                }

                return IconButton(
                  onPressed: () {
                    if (isFavorite) {
                      context.read<removeFavoriteBloc>().add(removeFavoriteMovie(widget.id.toString()));
                    } else {
                      MovieAddFavourite movie = MovieAddFavourite(
                        movieId: widget.id.toString(),
                        name: widget.title,
                        rating: double.parse(widget.rate),
                        imageURL: widget.imageurl,
                        year: widget.year,
                      );
                      context.read<FavoriteBloc>().add(AddFavoriteMovie(movie));
                    }

                    // Delay the check to ensure backend updates before rechecking state
                    Future.delayed(Duration(milliseconds: 500), () {
                      context.read<IsFavBloc>().add(CheckFavoriteStatusEvent(widget.id.toString()));
                    });
                  },
                  icon: state is IsFavLoadingState
                      ? CircularProgressIndicator() // Show loading if API is processing
                      : Image.asset(
                    isFavorite ? ImagePath.save : ImagePath.unsave,
                    color: AppColors.whitecolor,
                  ),
                );
              },
            ),
          ],
          iconTheme: IconThemeData(color: AppColors.whitecolor),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    onTap: () {
                      _launchURL(widget.imageurl);
                    },
                    child: Image.asset(ImagePath.pause),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.descriptionFull,
                      textAlign: TextAlign.center,
                      style: Fontspath.w700Inter24(
                          color: AppColors.whitecolor),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        backgroundColor: AppColors.redcolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      onPressed: () {
                        _launchURL(widget.imageurl);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Watch',
                              style: Fontspath.w700Inter20(
                                  color: AppColors.whitecolor)),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListViewRate(PathImage: ImagePath.heart, value: '15'),
                      ListViewRate(PathImage: ImagePath.clock, value: '90'),
                      ListViewRate(PathImage: ImagePath.star, value: '7.5'),
                    ],
                  ),
                  Image.network(widget.imageBackground),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
