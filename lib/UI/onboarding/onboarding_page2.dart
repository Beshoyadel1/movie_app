import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/UI/onboarding/onboarding_page1.dart';
import 'package:movie_app/UI/onboarding/onboarding_page2.dart';
import 'package:movie_app/UI/onboarding/onboarding_page3.dart';
import 'package:movie_app/UI/onboarding/widget_screen_onboarding.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';

class onboarding_page2 extends StatelessWidget {
  static const String RouteName = 'onboarding_page2';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return widget_screen_onboarding(
      screenview_back: onboarding_page1.RouteName,
      colorbackground: AppColors.blackcolor,
        description: 'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
        background: ImagePath.onboarding2,
        first_button: 'Next',
        firstTitle: 'Discover Movies',
        second_button: '',
        screenview_next: onboarding_page3.RouteName);
  }
}
