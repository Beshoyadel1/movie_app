import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/UI/Navigationbar/Home/ItemViewMovie.dart';
import 'package:movie_app/UI/Navigationbar/Home/ListItems.dart';
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
    List<Map<String, dynamic>> movies = [
      {"image": ImagePath.film1, "rating": "7.7"},
      {"image": ImagePath.film2, "rating": "8.2"},
      {"image": ImagePath.film3, "rating": "6.9"},
      {"image": ImagePath.film4, "rating": "7.7"},
      {"image": ImagePath.film5, "rating": "8.2"},
      {"image": ImagePath.film6, "rating": "6.9"},
      {"image": ImagePath.film7, "rating": "7.7"},
      {"image": ImagePath.film8, "rating": "8.2"},
      {"image": ImagePath.film9, "rating": "6.9"},
      {"image": ImagePath.film10, "rating": "7.7"},
      {"image": ImagePath.film11, "rating": "8.2"},
      {"image": ImagePath.film12, "rating": "6.9"},
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
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
                  items: movies.map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ItemViewMovie(
                          PathImage: movie["image"],
                          rate: movie["rating"],
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
                    ListItems(
                      PathImage:ImagePath.film10,
                      rate: '5.1',
                    ),
                    ListItems(
                      PathImage:ImagePath.film11,
                      rate: '5.1',
                    ),ListItems(
                      PathImage:ImagePath.film12,
                      rate: '5.1',
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
