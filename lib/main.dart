import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/UI/Auth/CreateAccount.dart';
import 'package:movie_app/UI/Auth/Forget%20Password.dart';
import 'package:movie_app/UI/Auth/login.dart';
import 'package:movie_app/UI/Navigationbar/HomeNavigationbar.dart';
import 'package:movie_app/UI/Navigationbar/Profile/EditProfile/EditProfile.dart';
import 'package:movie_app/UI/Navigationbar/Profile/EditProfile/ResetPasswordScreen.dart';
import 'package:movie_app/UI/Navigationbar/Profile/ProfileHome.dart';
import 'package:movie_app/UI/onboarding/onboarding_page1.dart';
import 'package:movie_app/UI/onboarding/onboarding_page2.dart';
import 'package:movie_app/UI/onboarding/onboarding_page3.dart';
import 'package:movie_app/UI/onboarding/onboarding_page4.dart';
import 'package:movie_app/UI/onboarding/onboarding_page5.dart';
import 'package:movie_app/UI/onboarding/onboarding_page6.dart';
import 'package:movie_app/api/AddMovieLoveApi/FavoriteRepository.dart';
import 'package:movie_app/api/IsFavMovie/IsFavMovieRepository.dart';
import 'package:movie_app/api/MovieDetailsApi/MovieDetailsRepository.dart';
import 'package:movie_app/api/ProfileApi/ProfileRepository.dart';
import 'package:movie_app/api/Signin%20Api/LoginRepository.dart';
import 'package:movie_app/api/SignupApi/SignupRepository.dart';
import 'package:movie_app/api/removeMoveLove/RemoveMoveLove.dart';
import 'package:movie_app/bloc/AddFavoriteMoveBloc/add_favorite_movie_bloc.dart';
import 'package:movie_app/bloc/DeleteBloc/delete_bloc.dart';
import 'package:movie_app/bloc/LanguageBloc/language_bloc.dart';
import 'package:movie_app/bloc/LanguageBloc/language_state.dart';
import 'package:movie_app/bloc/LoginBloc/login_bloc.dart';
import 'package:movie_app/bloc/MovieDetailsBloc/movie_details_bloc.dart';
import 'package:movie_app/bloc/OnboardingBloc/onboarding__bloc.dart';
import 'package:movie_app/bloc/createAccountBloc/create_account_bloc.dart';
import 'package:movie_app/bloc/isFavoriteMovieBloc/is_favorite_movie_bloc.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_bloc.dart';
import 'package:movie_app/bloc/removeFavoriteMoveBloc/remove_favorite_movie_bloc.dart';
import 'package:movie_app/bloc/resetpasswordBloc/reset_password_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final RepositorySignup = SignupRepository();
  final RepositoryLogin = LoginRepository();
  final Repositoryprofile = ProfileRepository();
  final RepositoryaddMovie = FavoriteRepository();
  final RepositoryDetailsMovie = MovieRepository();
  final RepositoryremoveMovie = removeFavoriteRepository();
  final RepositoryIsFavMovie = IsFavMovieRepository();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageBloc()),
        BlocProvider(create: (context) => OnboardingCubit()),
        BlocProvider(create: (context) => LoginBloc(RepositoryLogin)),
        BlocProvider(create: (context) => SignupBloc(RepositorySignup)),
        BlocProvider(create: (context) => DataProfileBloc(Repositoryprofile)),
        BlocProvider(create: (context) => DeleteAccountBloc(RepositoryLogin)),
        BlocProvider(create: (context) => ResetPasswordBloc(loginRepository: RepositoryLogin)),
        BlocProvider(create: (context) => FavoriteBloc(RepositoryaddMovie)),
        BlocProvider(create: (context) => MovieBloc(RepositoryDetailsMovie)),
        BlocProvider(create: (context) => removeFavoriteBloc(RepositoryremoveMovie)),
        BlocProvider(create: (context) => IsFavBloc(RepositoryIsFavMovie)),

      ],
      child: MyApp(),
    ),
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
          initialRoute: onboarding_page1.RouteName,
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
            EditProfile.RouteName: (context) => EditProfile(),
            ProfileHome.RouteName: (context) => ProfileHome(),
            ResetPasswordScreen.RouteName: (context) =>ResetPasswordScreen(),
          },
        );
      },
    );
  }
}
