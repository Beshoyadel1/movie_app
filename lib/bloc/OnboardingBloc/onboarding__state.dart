import 'dart:ui';

class OnboardingState {
  final String description;
  final String background;
  final String firstButton;
  final String firstTitle;
  final String secondButton;
  final String screenviewNext;
  final String screenviewBack;
  final Color? colorbackground;

  OnboardingState({
    required this.description,
    required this.background,
    required this.firstButton,
    required this.firstTitle,
    required this.secondButton,
    required this.screenviewNext,
    required this.screenviewBack,
    this.colorbackground,
  });
}