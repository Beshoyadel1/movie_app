import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/UI/Navigationbar/Home/DetailsMove/DetailsMovieScreen.dart';
import 'package:movie_app/UI/Navigationbar/Home/ItemViewMovie.dart';
import 'package:movie_app/UI/Navigationbar/custom%20widget/MovieList.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(ImagePath.AvailableNow),
                CarouselSlider(
                  options: CarouselOptions(
                    height: height*0.4, // Increased height for bigger movie cards
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: width*0.0012, // Makes items appear bigger
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                  ),
                  items: MovieList.movies.map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: (){
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
                            heightscreen: 1,
                            widthscreen: 1,
                            PathImage: movie["image"],
                            rate: movie["rating"],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
            
                 SizedBox(height: height*0.02), // Added spacing for better layout
                Image.asset(ImagePath.watchnow),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Action',style: Fontspath.w400Inter20(color: AppColors.whitecolor),),
                    Text('see more ->',style: Fontspath.w400Inter20(color: AppColors.yellocolor),),
                  ],
                ),
                SizedBox(height: height*0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsMovieScreen(
                              imageBackground: ImagePath.film10, // Pass the image dynamically
                            ),
                          ),
                        );
                      },
                      child: ItemViewMovie(
                        widthscreen: 0.3,
                        heightscreen:0.2 ,
                        PathImage:ImagePath.film10,
                        rate: '5.1',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsMovieScreen(
                              imageBackground: ImagePath.film11, // Pass the image dynamically
                            ),
                          ),
                        );
                      },
                      child: ItemViewMovie(
                        heightscreen: 0.2,
                        widthscreen: 0.3,
                        PathImage:ImagePath.film11,
                        rate: '3.6',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsMovieScreen(
                              imageBackground: ImagePath.film12, // Pass the image dynamically
                            ),
                          ),
                        );
                      },
                      child: ItemViewMovie(
                        heightscreen: 0.2,
                        widthscreen: 0.3,
                        PathImage:ImagePath.film12,
                        rate: '4.2',
                      ),
                    ),
                  ],
                ),
            
              ],
            ),
          ),
        ],
      ),
    );
  }
}
