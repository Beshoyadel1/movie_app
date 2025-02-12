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

class DetailsMovieScreen extends StatefulWidget {
  static const String routeName = 'DetailsMovieScreen';

  final String imageBackground, rate, title, descriptionFull,name,imageurl,year;
  final int id;

   DetailsMovieScreen({
    required this.imageBackground,
    required this.rate,
    required this.id,
    required this.title,
    required this.descriptionFull,
     required this.name,
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

    return BlocProvider(
      create: (context) => AddFavoriteBloc(FavoriteRepository()), // Provide Bloc
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            BlocConsumer<AddFavoriteBloc, AddFavoriteState>(
              listener: (context, state) {
                if (state is AddFavoriteSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Movie added to favorites!")),
                  );
                } else if (state is AddFavoriteFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed to add favorite: ${state.error}")),
                  );
                  print("Failed to add favorite: ${state.error}");
                }
              },
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      isSelect = !isSelect;
                    });

                    if (isSelect) {
                      context.read<AddFavoriteBloc>().add(AddMovieToFavorites(movieId: widget.id.toString()));
                    }
                  },
                  child: state is AddFavoriteLoading
                      ? CircularProgressIndicator()
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
                    onTap: () {},
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListViewRate(PathImage: ImagePath.heart, value: '15'),
                        ListViewRate(PathImage: ImagePath.clock, value: '90'),
                        ListViewRate(PathImage: ImagePath.star, value: '7.5'),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Image.network(widget.imageBackground),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
