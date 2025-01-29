import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/UI/Navigationbar/Browse/BrowseHome.dart';
import 'package:movie_app/UI/Navigationbar/Home/Home_Screen.dart';
import 'package:movie_app/UI/Navigationbar/Profile/ProfileHome.dart';
import 'package:movie_app/UI/Navigationbar/Search/SearchHome.dart';
import 'package:movie_app/assets/AppColors.dart';

import '../../assets/ImagePath.dart';

class HomeNavigationbar extends StatefulWidget {
  static const String RouteName = 'HomeNavigationbar';

  @override
  State<HomeNavigationbar> createState() => _HomeNavigationbarState();
}

class _HomeNavigationbarState extends State<HomeNavigationbar> {
  int selectindex=0;
  List<Widget>tabs=[Home_Screen(),SearchHome(),BrowseHome(),ProfileHome()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectindex],
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,

        shape: CircularNotchedRectangle(),
        notchMargin: 4,
        child: BottomNavigationBar(
          selectedItemColor:Colors.yellow,
          unselectedItemColor:Colors.white,
          backgroundColor: AppColors.graycolor,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectindex,
          onTap: (index){
            selectindex=index;
            setState(() {
            });
          },
          items:[
            BottomNavigationBarItem(icon:selectindex==0 ?
            const ImageIcon(
                AssetImage(ImagePath.home_select))
                :
            const ImageIcon(
                AssetImage(ImagePath.home)),
                label: ''),
            BottomNavigationBarItem(icon:selectindex==1?
            const ImageIcon(
                AssetImage(ImagePath.browse_select))
                :
            const ImageIcon(
                AssetImage(ImagePath.browse)),
                label:''),
            BottomNavigationBarItem(icon: selectindex==2?
            const ImageIcon(
                AssetImage(ImagePath.search_select))
                :
            const ImageIcon(
                AssetImage(ImagePath.search)),
                label: ''),
            BottomNavigationBarItem(icon: selectindex==3?
            const ImageIcon(
                AssetImage(ImagePath.profile_select))
                :
            const ImageIcon(
                AssetImage(ImagePath.profile)),
                label: ''),
          ],
        ),
      ),
    );
  }
}
