import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/bloc/OnboardingBloc/onboarding__state.dart';



class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState(
    description: '',
    background: '',
    firstButton: '',
    firstTitle: '',
    secondButton: '',
    screenviewNext: '',
    screenviewBack: '',
  ));

  void loadOnboardingData({
    required String description,
    required String background,
    required String firstButton,
    required String firstTitle,
    required String secondButton,
    required String screenviewNext,
    required String screenviewBack,
    Color? colorbackground,
  }) {
    emit(OnboardingState(
      description: description,
      background: background,
      firstButton: firstButton,
      firstTitle: firstTitle,
      secondButton: secondButton,
      screenviewNext: screenviewNext,
      screenviewBack: screenviewBack,
      colorbackground: colorbackground,
    ));
  }
}
