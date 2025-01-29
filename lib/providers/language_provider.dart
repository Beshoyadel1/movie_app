import 'package:flutter/material.dart';

class Applanguageprovider extends ChangeNotifier{

  String applanguage='en';

  void chagelanguage(String newlanguage){
    if(applanguage==newlanguage){
      return;
    }
   applanguage=newlanguage;
    notifyListeners();
  }

}