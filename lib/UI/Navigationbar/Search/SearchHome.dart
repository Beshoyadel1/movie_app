import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/assets/AppColors.dart';

class SearchHome extends StatefulWidget {
  const SearchHome({super.key});

  @override
  State<SearchHome> createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackcolor,
    );
  }
}
