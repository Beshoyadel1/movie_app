import 'package:flutter/material.dart';
import 'package:movie_app/UI/Navigationbar/Home/DetailsMove/ListViewRate.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';

class DetailsMovieScreen extends StatefulWidget {
  static const String routeName = 'DetailsMovieScreen';
  final String imageBackground; // Fixed variable name

  const DetailsMovieScreen({super.key, required this.imageBackground});

  @override
  State<DetailsMovieScreen> createState() => _DetailsMovieScreenState();
}

class _DetailsMovieScreenState extends State<DetailsMovieScreen> {
  bool isSelect = false; // Moved outside build method for better state management

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                isSelect = !isSelect;
              });
            },
            child: Image.asset(
              isSelect ? ImagePath.save : ImagePath.unsave,
              color: AppColors.whitecolor,
            ),
          )
        ],
        iconTheme: IconThemeData(color: AppColors.whitecolor),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imageBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: (){},
                  child: Image.asset(ImagePath.pause),
                ),
                Text('Doctor Strange in the Multiverse of Madness',textAlign: TextAlign.center,
                  style:Fontspath.w700Inter24(color: AppColors.whitecolor),),
                Container(
                  padding:  EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      backgroundColor: AppColors.redcolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Watch', style: Fontspath.w700Inter20(color: AppColors.whitecolor)),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection:Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListViewRate(PathImage:ImagePath.heart, value:'15'),
                      ListViewRate(PathImage:ImagePath.clock, value:'90'),
                      ListViewRate(PathImage:ImagePath.star, value:'7.5'),
                    ],
                  ),
                ),
              SizedBox(
                height: height*0.02,
              ),
              Image.asset(ImagePath.test,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
