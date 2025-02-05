import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/UI/Navigationbar/Search/MovieGridView.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';

class SearchHome extends StatefulWidget {
  const SearchHome({super.key});

  @override
  State<SearchHome> createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.blackcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height*0.03,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.graycolor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                style: Fontspath.w400Inter20(color: AppColors.whitecolor),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: AppColors.whitecolor,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                onTap: (){},
              ),
        
            ),
            MovieGridView(),
          ],
        ),
      ),
    );
  }
}
