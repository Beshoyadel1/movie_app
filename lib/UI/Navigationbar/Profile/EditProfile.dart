import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/UI/Navigationbar/HomeNavigationbar.dart';
import 'package:movie_app/UI/Navigationbar/Profile/ListAvatar.dart';
import 'package:movie_app/UI/Navigationbar/Profile/ProfileHome.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:movie_app/bloc/profileBloc/image_bloc.dart';
import 'package:movie_app/bloc/profileBloc/image_state.dart';

class EditProfile extends StatefulWidget {
  static const String RouteName = 'EditProfile';
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.blackcolor,
      appBar: AppBar(
        backgroundColor: AppColors.blackcolor,
        title: Text('Pick Avatar',style: Fontspath.w700Inter20(color: AppColors.yellocolor),),
        centerTitle: true,
        leading: IconButton(onPressed:(){
          Navigator.pushNamed(context,HomeNavigationbar.RouteName);
        }, icon: Icon(Icons.arrow_back,color: AppColors.yellocolor,)),
      ),
      body: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          String selectedImage = state is ImageSelected
              ? state.selectedImage
              : ImagePath.face1;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height*0.03,
              ),
              InkWell(
                  onTap: (){
                    showlistbottonsheet();
                  },
                  child: Image.asset(selectedImage,alignment: Alignment.center)
              ),
              SizedBox(
                height: height*0.03,
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.graycolor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: width*0.02,
                    ),
                    Icon(Icons.person,color: AppColors.whitecolor,),
                    SizedBox(
                      width: width*0.04,
                    ),
                    Text('John Safwat',style: Fontspath.w400Inter20(color: AppColors.whitecolor),)
                  ],
                ),
              ),
              SizedBox(
                height: height*0.01,
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.graycolor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: width*0.02,
                    ),
                    Icon(Icons.phone,color: AppColors.whitecolor,),
                    SizedBox(
                      width: width*0.04,
                    ),
                    Text('012000000',style: Fontspath.w400Inter20(color: AppColors.whitecolor),)
                  ],
                ),
              ),
              SizedBox(
                height: height*0.01,
              ),
              Row(
                children: [
                  Text('Reset Password',style: Fontspath.w400Inter20(color: AppColors.whitecolor),textAlign: TextAlign.right,),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding:const EdgeInsets.all(10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            backgroundColor:AppColors.redcolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13), // No rounded corners
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Delete Account',style: Fontspath.w500Inter20(color: AppColors.whitecolor),),
                            ],
                          )),

                    ),
                    Container(
                      padding:const EdgeInsets.all(10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            backgroundColor:AppColors.yellocolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13), // No rounded corners
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context,ProfileHome.RouteName);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Update Data',style: Fontspath.w500Inter20(color: AppColors.blackcolor),),
                            ],
                          )),

                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height*0.02,
              ),
            ],
          );
        }
      ),

    );
  }
  void showlistbottonsheet(){
    showModalBottomSheet(
        context: context,
        builder: (context)=>ListAvatar()
    );
  }
}
