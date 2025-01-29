import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/UI/onboarding/onboarding_page2.dart';
import 'package:movie_app/UI/onboarding/widget_screen_onboarding.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';

class onboarding_page1 extends StatelessWidget {
  static const String RouteName = 'onboarding_page1';

  @override
  Widget build(BuildContext context) {
   var height=MediaQuery.of(context).size.height;
   var width=MediaQuery.of(context).size.width;
   return widget_screen_onboarding(
     screenview_back: '',
       description: 'Get access to a huge library of movies to suit all tastes. You will surely like it.',
       background: ImagePath.onboarding1,
       first_button: 'Explore Now',
       firstTitle: 'Find Your Next Favorite Movie Here',
       second_button: '',
       screenview_next: onboarding_page2.RouteName);
  }

}
