import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/UI/onboarding/onboarding_page2.dart';
import 'package:movie_app/UI/onboarding/widget_screen_onboarding.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class onboarding_page1 extends StatelessWidget {
  static const String RouteName = 'onboarding_page1';
  @override
  Widget build(BuildContext context) {
   var height=MediaQuery.of(context).size.height;
   var width=MediaQuery.of(context).size.width;
   return widget_screen_onboarding(
     screenview_back: '',
       description:AppLocalizations.of(context)!.onboarding1_description,
       background: ImagePath.onboarding1,
       first_button: AppLocalizations.of(context)!.onboarding1_first_button,
       firstTitle: AppLocalizations.of(context)!.onboarding1_firstTitle,
       second_button: AppLocalizations.of(context)!.onboarding1_second_button,
       screenview_next: onboarding_page2.RouteName);
  }
}
