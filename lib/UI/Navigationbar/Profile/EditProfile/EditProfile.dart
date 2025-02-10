import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/UI/Auth/login.dart';
import 'package:movie_app/UI/Navigationbar/HomeNavigationbar.dart';
import 'package:movie_app/UI/Navigationbar/Profile/EditProfile/ListAvatar.dart';
import 'package:movie_app/UI/Navigationbar/Profile/EditProfile/ResetPasswordScreen.dart';
import 'package:movie_app/UI/Navigationbar/Profile/ProfileHome.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:movie_app/bloc/DeleteBloc/delete_bloc.dart';
import 'package:movie_app/bloc/DeleteBloc/delete_event.dart';
import 'package:movie_app/bloc/DeleteBloc/delete_state.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_bloc.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_event.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  static const String RouteName = 'EditProfile';
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool isclick = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.blackcolor,
      appBar: AppBar(
        backgroundColor: AppColors.blackcolor,
        title: Text(
          'Edit Profile',
          style: Fontspath.w700Inter20(color: AppColors.yellocolor),
        ),
        centerTitle: true,
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<DataProfileBloc, DataProfileState>(
            listener: (context, state) {
              if (state is ProfileUpdated) {
                nameController.text = state.name;
                phoneController.text = state.phoneNumber;
              }
            },
          ),
          BlocListener<DeleteAccountBloc, DeleteAccountState>(
            listener: (context, state) {
              if (state is DeleteAccountSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Account deleted successfully")),
                );
                Navigator.pushReplacementNamed(context, login.RouteName);
              } else if (state is DeleteAccountFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
          ),
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.03),
            InkWell(
              onTap: showlistbottonsheet,
              child: SizedBox(
                width: width * 0.3,
                height: width * 0.3,
                child: Image.asset(
                  ImagePath.face1,
                  fit: BoxFit.cover,
                ),
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
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, ResetPasswordScreen.RouteName);
              },
                child: Text('RestPassword',style: Fontspath.w400Inter20(color: AppColors.whitecolor),
                )
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  buildButton(AppColors.redcolor, "Delete Account", () async {
                    final prefs = await SharedPreferences.getInstance();
                    final token = prefs.getString('auth_token');

                    if (token != null) {
                      context.read<DeleteAccountBloc>().add(DeleteAccountRequested(token));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("No authentication token found!")),
                      );
                    }
                  }),
                  buildButton(AppColors.yellocolor, "Update Data", () {
                    setState(() {
                      isclick = true;
                    });
                    Navigator.pushNamed(context, HomeNavigationbar.RouteName);
                  }),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(IconData icon, String hintText, TextEditingController controller, Function(String) onChanged) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.graycolor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
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
      ),
    );
  }

  Widget buildButton(Color color, String text, VoidCallback onPressed) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Fontspath.w500Inter20(color: AppColors.whitecolor),
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

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    Navigator.pushNamed(context, login.RouteName);
  }
}
