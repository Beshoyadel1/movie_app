import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/UI/onboarding/onboarding_page2.dart';
import 'package:movie_app/UI/onboarding/onboarding_page4.dart';
import 'package:movie_app/UI/onboarding/onboarding_page6.dart';
import 'package:movie_app/UI/onboarding/widget_screen_onboarding.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';

class onboarding_page5 extends StatelessWidget {
  static const String RouteName = 'onboarding_page5';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return widget_screen_onboarding(
      screenview_back: onboarding_page4.RouteName,
      colorbackground: AppColors.blackcolor,
      description: 'Share your thoughts on the movies you ve watched. Dive deep into film details and help others discover great movies with your reviews',
      background: ImagePath.onboarding5,
      first_button: 'Next',
      firstTitle: 'Rate, Review, and Learn',
      second_button: 'Back',
      screenview_next: onboarding_page6.RouteName,
    );
  }
}
