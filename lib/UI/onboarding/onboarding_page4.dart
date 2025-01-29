import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/UI/onboarding/onboarding_page2.dart';
import 'package:movie_app/UI/onboarding/onboarding_page3.dart';
import 'package:movie_app/UI/onboarding/onboarding_page5.dart';
import 'package:movie_app/UI/onboarding/widget_screen_onboarding.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';

class onboarding_page4 extends StatelessWidget {
  static const String RouteName = 'onboarding_page4';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return widget_screen_onboarding(
      screenview_back: onboarding_page3.RouteName,
      colorbackground: AppColors.blackcolor,
      description: 'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
      background: ImagePath.onboarding4,
      first_button: 'Next',
      firstTitle: 'Create Watch lists',
      second_button: 'Back',
      screenview_next: onboarding_page5.RouteName,
    );
  }
}
