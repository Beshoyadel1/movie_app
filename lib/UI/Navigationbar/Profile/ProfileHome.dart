import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/UI/Auth/login.dart';
import 'package:movie_app/UI/Navigationbar/Profile/EditProfile/EditProfile.dart';
import 'package:movie_app/UI/Navigationbar/Profile/History.dart';
import 'package:movie_app/UI/Navigationbar/Profile/Watch%20List.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_bloc.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_state.dart';

class ProfileHome extends StatefulWidget {
  static const String RouteName = 'ProfileHome';

  const ProfileHome({super.key});

  @override
  State<ProfileHome> createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.graycolor,
      body: BlocBuilder<DataProfileBloc, DataProfileState>(
        builder: (context, state) {
          String selectedImage = state is ProfileUpdated ? state.selectedImage : ImagePath.face1;
          String userName = state is ProfileUpdated ? state.name : "User"; // Get name from state

          return Column(
            children: [
              SizedBox(height: height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(selectedImage),
                      Text(
                        userName, // Use dynamic name from state
                        style: Fontspath.w700Inter20(color: AppColors.whitecolor),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '12',
                        style: Fontspath.w700Inter36(color: AppColors.whitecolor),
                      ),
                      Text(
                        'Wish List',
                        style: Fontspath.w700Inter24(color: AppColors.whitecolor),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '10',
                        style: Fontspath.w700Inter36(color: AppColors.whitecolor),
                      ),
                      Text(
                        'History',
                        style: Fontspath.w700Inter24(color: AppColors.whitecolor),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding:  EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.18, vertical: height * 0.01),
                        backgroundColor: AppColors.yellocolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, EditProfile.RouteName);
                      },
                      child: Text(
                        'Edit Profile',
                        style: Fontspath.w500Inter20(color: AppColors.blackcolor),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.08, vertical: height * 0.01),
                      backgroundColor: AppColors.redcolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, login.RouteName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Exit',
                          style: Fontspath.w500Inter20(color: AppColors.whitecolor),
                        ),
                        SizedBox(width: width * 0.02),
                        Icon(Icons.login, color: AppColors.whitecolor),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              TabBar(
                controller: _tabController,
                indicatorColor: AppColors.yellocolor,
                labelColor: AppColors.whitecolor,
                unselectedLabelColor: AppColors.whitecolor,
                dividerColor: AppColors.graycolor,
                labelStyle: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.whitecolor,
                ),
                padding: EdgeInsets.all(10),
                tabs: [
                  Tab(
                    icon: Image.asset(ImagePath.list, width: width * 0.1),
                    text: 'Watch List',
                  ),
                  Tab(
                    icon: Image.asset(ImagePath.folder, width: width * 0.1),
                    text: 'History',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    WatchList(),
                    History(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
