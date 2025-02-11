import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/UI/Auth/login.dart';
import 'package:movie_app/UI/Navigationbar/HomeNavigationbar.dart';
import 'package:movie_app/UI/Navigationbar/Profile/EditProfile/ListAvatar.dart';
import 'package:movie_app/UI/Navigationbar/Profile/EditProfile/ResetPasswordScreen.dart';
import 'package:movie_app/UI/custom%20widget/AvatarList.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<DataProfileBloc>().add(LoadProfile());
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

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
              if (state is ProfileSavedSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Profile updated successfully")),
                );
                Navigator.pushNamed(context, HomeNavigationbar.RouteName);
              } else if (state is ProfileError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
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
        child: BlocBuilder<DataProfileBloc, DataProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileUpdated) {
              return buildProfileForm(state, height, width);
            } else {
              return Center(child: Text("Failed to load profile"));
            }
          },
        ),
      ),
    );
  }

  Widget buildProfileForm(ProfileUpdated state, double height, double width) {
    nameController.text = state.name;
    phoneController.text = state.phoneNumber;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: height * 0.03),
        InkWell(
          onTap: showListBottomSheet,
          child: CircleAvatar(
            radius: width * 0.15,
            backgroundImage: AssetImage(
                Avatar.avatarImages[state.avatarId]), // Avatar
          ),
        ),
        SizedBox(height: height * 0.03),

        // Name Field
        BlocSelector<DataProfileBloc, DataProfileState, String>(
          selector: (state) => (state is ProfileUpdated) ? state.name : '',
          builder: (context, name) {
            return buildTextField(
              Icons.person,
              "Name",
              nameController..text = name,
                  (value) =>
                  context.read<DataProfileBloc>().add(UpdateName(value)),
            );
          },
        ),
        SizedBox(height: height * 0.01),

        // Phone Number Field
        BlocSelector<DataProfileBloc, DataProfileState, String>(
          selector: (state) =>
          (state is ProfileUpdated)
              ? state.phoneNumber
              : '',
          builder: (context, phone) {
            return buildTextField(
              Icons.phone,
              "Phone Number",
              phoneController..text = phone,
                  (value) =>
                  context.read<DataProfileBloc>().add(UpdatePhoneNumber(value)),
            );
          },
        ),
        SizedBox(height: height * 0.01),

        // Reset Password
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, ResetPasswordScreen.RouteName);
          },
          child: Text('Reset Password',
              style: Fontspath.w400Inter20(color: AppColors.whitecolor)),
        ),

        // Buttons
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              buildButton(AppColors.redcolor, "Delete Account", deleteAccount),
              buildButton(AppColors.yellocolor, "Save", () {
                context.read<DataProfileBloc>().add(SaveProfile());
              }),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
      ],
    );
  }

  Widget buildTextField(IconData icon, String hintText,
      TextEditingController controller, Function(String) onChanged) {
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

  void showListBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ListAvatar(),
    ).then((selectedAvatar) {
      if (selectedAvatar != null) {
        context.read<DataProfileBloc>().add(UpdateAvatarId(selectedAvatar));
      }
    });
  }

  void deleteAccount() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token != null) {
      context.read<DeleteAccountBloc>().add(DeleteAccountRequested(token));
    }
  }
}
