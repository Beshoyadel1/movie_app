import 'package:flutter/material.dart';

class Appthemeprovider extends ChangeNotifier{

  ThemeMode apptheme=ThemeMode.light;

  void chagetheme(ThemeMode newtheme){
    if(apptheme==newtheme){
      return;
    }
    apptheme=newtheme;
    notifyListeners();
  }

}