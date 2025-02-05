import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/UI/Navigationbar/Browse/tabwidghtlist.dart';
import 'package:movie_app/UI/Navigationbar/Search/MovieGridView.dart';
import 'package:movie_app/UI/Navigationbar/custom%20widget/MovieList.dart';
import 'package:movie_app/assets/AppColors.dart';

class BrowseHome extends StatefulWidget {
  const BrowseHome({super.key});

  @override
  State<BrowseHome> createState() => _BrowseHomeState();
}

class _BrowseHomeState extends State<BrowseHome> {
  int selectindex=0;
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
            DefaultTabController(
              length: MovieList.MoviesListTypes.length,
              child: TabBar(
                onTap: (index) {
                  selectindex = index;
                  setState(() {});
                },
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.zero,
                indicatorColor: AppColors.transparent,
                dividerColor: AppColors.transparent,
                isScrollable: true,
                tabs: MovieList.MoviesListTypes.map((eventsName) {
                  return tabwidghtDesign(
                    isSelected: selectindex == MovieList.MoviesListTypes.indexOf(eventsName),
                    evenname: eventsName,
                  );
                }).toList(),
              ),
            ),
            MovieGridView(),
          ],
        ),
      ),
    );
  }
}
