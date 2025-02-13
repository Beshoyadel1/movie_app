import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/api/AddMovieLoveApi/FavoriteRepository.dart';
import 'package:movie_app/bloc/AddFavoriteMoveBloc/add_favorite_movie_bloc.dart';
import 'package:movie_app/bloc/AddFavoriteMoveBloc/add_favorite_movie_event.dart';
import 'package:movie_app/bloc/AddFavoriteMoveBloc/add_favorite_movie_state.dart';
import 'package:flutter/material.dart';
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

  const DetailsMovieScreen({
    required this.imageBackground,
    required this.rate,
    required this.id,
    required this.title,
    required this.descriptionFull,
    required this.imageurl,
    required this.year,
  });

  @override
  State<DetailsMovieScreen> createState() => _DetailsMovieScreenState();
}

class _DetailsMovieScreenState extends State<DetailsMovieScreen> {
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    Future<void> _launchURL(String url) async {
      Uri uri = Uri.parse(url);

      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        print("Could not launch $url");
        throw Exception("Could not launch $url");
      }
    }


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back),color: AppColors.whitecolor,),
        actions: [
          BlocConsumer<FavoriteBloc,FavoriteState>(
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
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  setState(() {
                    isSelect = !isSelect;
                  });

                  if (isSelect) {
                    MovieAddFavourite movie = MovieAddFavourite(
                      movieId: widget.id.toString(),
                      name: widget.title,
                      rating: double.parse(widget.rate),
                      imageURL: widget.imageurl,
                      year: widget.year,
                    );

                    context.read<FavoriteBloc>().add(AddFavoriteMovie(movie));
                  }
                },
                child: state is FavoriteLoading
                    ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(color: AppColors.whitecolor),
                )
                    : Image.asset(
                  isSelect ? ImagePath.save : ImagePath.unsave,
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
                    style: Fontspath.w700Inter24(color: AppColors.whitecolor),
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
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Watch', style: Fontspath.w700Inter20(color: AppColors.whitecolor)),
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
                SizedBox(height: height * 0.02),
                Image.network(widget.imageBackground),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
