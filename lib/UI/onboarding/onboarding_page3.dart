import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/UI/onboarding/onboarding_page2.dart';
import 'package:movie_app/UI/onboarding/onboarding_page4.dart';
import 'package:movie_app/UI/onboarding/widget_screen_onboarding.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/bloc/OnboardingBloc/onboarding__bloc.dart';

class onboarding_page3 extends StatelessWidget {
  static const String RouteName = 'onboarding_page3';

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<OnboardingCubit>(context).loadOnboardingData(
      screenviewBack: onboarding_page2.RouteName,
      colorbackground: AppColors.blackcolor,
        description: AppLocalizations.of(context)!.onboarding3_description,
        background: ImagePath.onboarding3,
        firstButton: AppLocalizations.of(context)!.onboarding2_first_button,
        firstTitle: AppLocalizations.of(context)!.onboarding3_firstTitle,
        secondButton: AppLocalizations.of(context)!.onboarding3_second_button,
      screenviewNext: onboarding_page4.RouteName,
    );
    return Scaffold(
      body: WidgetScreenOnboarding(),
    );
  }
}
