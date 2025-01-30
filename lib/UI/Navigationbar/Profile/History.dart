import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/ImagePath.dart';

class History extends StatelessWidget {
  History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColors.blackcolor,
      body: Center(
        child: Image.asset(ImagePath.empty),
      ),
    );
  }
}
