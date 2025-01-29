import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/assets/AppColors.dart';

class BrowseHome extends StatefulWidget {
  const BrowseHome({super.key});

  @override
  State<BrowseHome> createState() => _BrowseHomeState();
}

class _BrowseHomeState extends State<BrowseHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackcolor,
    );
  }
}
