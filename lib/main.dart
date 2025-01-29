import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/UI/Auth/CreateAccount.dart';
import 'package:movie_app/UI/Auth/Forget%20Password.dart';
import 'package:movie_app/UI/Auth/login.dart';
import 'package:movie_app/UI/onboarding/onboarding_page1.dart';
import 'package:movie_app/UI/onboarding/onboarding_page2.dart';
import 'package:movie_app/UI/onboarding/onboarding_page3.dart';
import 'package:movie_app/UI/onboarding/onboarding_page5.dart';
import 'package:movie_app/UI/onboarding/onboarding_page6.dart';
import 'package:movie_app/providers/Theme_provider.dart';
import 'package:movie_app/providers/language_provider.dart';
import 'package:provider/provider.dart';

import 'UI/onboarding/onboarding_page4.dart';


void main() async {

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create:(context)=>Applanguageprovider()),
            ChangeNotifierProvider(create:(context)=>Appthemeprovider()),
          ],
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<Applanguageprovider>(context);
    var providertheme=Provider.of<Appthemeprovider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.applanguage),
      //themeMode: providertheme.apptheme,
      themeMode: ThemeMode.dark,
      initialRoute: onboarding_page1.RouteName,
      routes: {
        onboarding_page1.RouteName:(context)=>onboarding_page1(),
        onboarding_page2.RouteName:(context)=>onboarding_page2(),
        onboarding_page3.RouteName:(context)=>onboarding_page3(),
        onboarding_page4.RouteName:(context)=>onboarding_page4(),
        onboarding_page5.RouteName:(context)=>onboarding_page5(),
        onboarding_page6.RouteName:(context)=>onboarding_page6(),
        login.RouteName:(context)=>login(),
        CreateAccount.RouteName:(context)=>CreateAccount(),
        Forget_Password.RouteName:(context)=>Forget_Password(),
      },
    );
  }
}
