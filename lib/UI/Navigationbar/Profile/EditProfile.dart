import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/UI/Navigationbar/HomeNavigationbar.dart';
import 'package:movie_app/UI/Navigationbar/Profile/ListAvatar.dart';
import 'package:movie_app/UI/Navigationbar/Profile/ProfileHome.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_bloc.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_event.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_state.dart';

class EditProfile extends StatefulWidget {
  static const String RouteName = 'EditProfile';
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.blackcolor,
      appBar: AppBar(
        backgroundColor: AppColors.blackcolor,
        title: Text('Edit Profile', style: Fontspath.w700Inter20(color: AppColors.yellocolor)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, HomeNavigationbar.RouteName);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.yellocolor),
        ),
      ),
      body: BlocBuilder<DataProfileBloc, DataProfileState>(
        builder: (context, state) {
          if (state is ProfileUpdated) {
            nameController.text = state.name;
            phoneController.text = state.phoneNumber;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.03),
              InkWell(
                onTap: showlistbottonsheet,
                child: Image.asset(
                  state is ImageSelectedDataProfile ? state.selectedImage : ImagePath.face1,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: height * 0.03),
              buildTextField(Icons.person, "Name", nameController, (value) {
                context.read<DataProfileBloc>().add(UpdateName(value));
              }),
              SizedBox(height: height * 0.01),
              buildTextField(Icons.phone, "Phone Number", phoneController, (value) {
                context.read<DataProfileBloc>().add(UpdatePhoneNumber(value));
              }),
              SizedBox(height: height * 0.01),
              Row(
                children: [
                  Text('Reset Password', style: Fontspath.w400Inter20(color: AppColors.whitecolor)),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    buildButton(AppColors.redcolor, "Delete Account", () {}),
                    buildButton(AppColors.yellocolor, "Update Data", () {
                      Navigator.pushNamed(context, HomeNavigationbar.RouteName);
                    }),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
            ],
          );
        },
      ),
    );
  }

  Widget buildTextField(IconData icon, String hintText, TextEditingController controller, Function(String) onChanged) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.graycolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(icon, color: AppColors.whitecolor),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(color: AppColors.whitecolor),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(Color color, String text, VoidCallback onPressed) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: Fontspath.w500Inter20(color: AppColors.whitecolor)),
          ],
        ),
      ),
    );
  }

  void showlistbottonsheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ListAvatar(),
    );
  }
}
