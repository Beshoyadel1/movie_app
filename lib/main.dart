import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/UI/Auth/CreateAccount.dart';
import 'package:movie_app/UI/Auth/Forget%20Password.dart';
import 'package:movie_app/UI/Auth/login.dart';
import 'package:movie_app/UI/Navigationbar/Home/Home_Screen.dart';
import 'package:movie_app/UI/Navigationbar/HomeNavigationbar.dart';
import 'package:movie_app/UI/Navigationbar/Profile/EditProfile.dart';
import 'package:movie_app/UI/Navigationbar/Profile/ProfileHome.dart';
import 'package:movie_app/UI/onboarding/onboarding_page1.dart';
import 'package:movie_app/UI/onboarding/onboarding_page2.dart';
import 'package:movie_app/UI/onboarding/onboarding_page3.dart';
import 'package:movie_app/UI/onboarding/onboarding_page5.dart';
import 'package:movie_app/UI/onboarding/onboarding_page6.dart';
import 'package:movie_app/bloc/ForgetpasswordBloc/forgetpassword_bloc.dart';
import 'package:movie_app/bloc/LanguageBloc/language_bloc.dart';
import 'package:movie_app/bloc/LanguageBloc/language_state.dart';
import 'package:movie_app/bloc/LoginBloc/login_bloc.dart';
import 'package:movie_app/bloc/OnboardingBloc/onboarding__bloc.dart';
import 'package:movie_app/bloc/OnboardingBloc/onboarding__state.dart';
import 'package:movie_app/bloc/createAccountBloc/create_account_bloc.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_bloc.dart';
import 'UI/onboarding/onboarding_page4.dart';


void main() async {
  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LanguageBloc()),
            BlocProvider(create: (context) => OnboardingCubit(),),
            BlocProvider(create: (context) => LoginBloc(),),
            BlocProvider(create: (context) => CreateAccountBloc(),),
            BlocProvider(create: (context) => ForgetpasswordBloc()),
           BlocProvider(create: (context) => DataProfileBloc()),
            //BlocProvider(create: (context) => ImageBloc()),
          ],
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(state.languageCode),
            themeMode: ThemeMode.dark,
            initialRoute: HomeNavigationbar.RouteName,
            routes: {
              onboarding_page1.RouteName: (context) => onboarding_page1(),
              onboarding_page2.RouteName: (context) => onboarding_page2(),
              onboarding_page3.RouteName: (context) => onboarding_page3(),
              onboarding_page4.RouteName: (context) => onboarding_page4(),
              onboarding_page5.RouteName: (context) => onboarding_page5(),
              onboarding_page6.RouteName: (context) => onboarding_page6(),
              login.RouteName: (context) => login(),
              CreateAccount.RouteName: (context) => CreateAccount(),
              Forget_Password.RouteName: (context) => Forget_Password(),
              HomeNavigationbar.RouteName: (context) => HomeNavigationbar(),
              EditProfile.RouteName: (context) =>EditProfile(),
              ProfileHome.RouteName: (context) =>ProfileHome(),
            },
          );
        }
    );
  }
}
