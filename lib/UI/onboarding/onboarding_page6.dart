import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/UI/Auth/login.dart';
import 'package:movie_app/UI/onboarding/onboarding_page2.dart';
import 'package:movie_app/UI/onboarding/onboarding_page5.dart';
import 'package:movie_app/UI/onboarding/widget_screen_onboarding.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class onboarding_page6 extends StatelessWidget {
  static const String RouteName = 'onboarding_page6';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return widget_screen_onboarding(
      screenview_back: onboarding_page5.RouteName,
      colorbackground: AppColors.blackcolor,
      description: '',
      background: ImagePath.onboarding6,
      first_button: AppLocalizations.of(context)!.onboarding6_first_button,
      firstTitle: AppLocalizations.of(context)!.onboarding6_firstTitle,
      second_button: AppLocalizations.of(context)!.onboarding3_second_button,
      screenview_next: login.RouteName,
    );
  }
}
