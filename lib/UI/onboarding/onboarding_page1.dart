import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/UI/onboarding/onboarding_page2.dart';
import 'package:movie_app/UI/onboarding/widget_screen_onboarding.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:movie_app/bloc/OnboardingBloc/onboarding__bloc.dart';
import 'package:movie_app/bloc/OnboardingBloc/onboarding__state.dart';

class onboarding_page1 extends StatelessWidget {
  static const String RouteName = 'onboarding_page1';

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<OnboardingCubit>(context).loadOnboardingData(
      screenviewBack: '',
      description: AppLocalizations.of(context)!.onboarding1_description,
      background: ImagePath.onboarding1,
      firstButton: AppLocalizations.of(context)!.onboarding1_first_button,
      firstTitle: AppLocalizations.of(context)!.onboarding1_firstTitle,
      secondButton: AppLocalizations.of(context)!.onboarding1_second_button,
      screenviewNext: onboarding_page2.RouteName,
    );
  return Scaffold(
  body: WidgetScreenOnboarding(),
  );
}
}









