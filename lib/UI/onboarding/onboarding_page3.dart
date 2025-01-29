import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/UI/onboarding/onboarding_page2.dart';
import 'package:movie_app/UI/onboarding/onboarding_page4.dart';
import 'package:movie_app/UI/onboarding/widget_screen_onboarding.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';

class onboarding_page3 extends StatelessWidget {
  static const String RouteName = 'onboarding_page3';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return widget_screen_onboarding(
      screenview_back: onboarding_page2.RouteName,
      colorbackground: AppColors.blackcolor,
        description: 'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
        background: ImagePath.onboarding3,
        first_button: 'Next',
        firstTitle: 'Explore All Genres',
        second_button: 'Back',
      screenview_next: onboarding_page4.RouteName,
    );
  }
}
