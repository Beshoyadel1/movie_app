import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/UI/Auth/login.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:movie_app/bloc/ResetPasswordBloc/reset_password_state.dart';
import 'package:movie_app/bloc/resetpasswordBloc/reset_password_bloc.dart';
import 'package:movie_app/bloc/resetpasswordBloc/reset_password_event.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String RouteName = 'ResetPasswordScreen';

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.blackcolor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, login.RouteName);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.yellocolor),
        ),
        backgroundColor: AppColors.blackcolor,
        centerTitle: true,
        title: Text(
          "Reset Password",
          style: Fontspath.w400Inter20(color: AppColors.yellocolor),
        ),
      ),
      body: BlocListener<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Password reset successful"))
            );
            Navigator.pushNamed(context, login.RouteName);
          } else if (state is ResetPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error))
            );
          }
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.02),
                  TextFormField(
                    style: TextStyle(color: AppColors.whitecolor),
                    controller: oldPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: AppColors.graycolor,
                      filled: true,
                      labelText: "Old Password",
                      prefixIcon: Icon(Icons.lock, color: AppColors.whitecolor),
                      labelStyle: TextStyle(color: AppColors.whitecolor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  TextFormField(
                    style: TextStyle(color: AppColors.whitecolor),
                    controller: newPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: AppColors.graycolor,
                      filled: true,
                      labelText: "New Password",
                      prefixIcon: Icon(Icons.lock_outline, color: AppColors.whitecolor),
                      labelStyle: TextStyle(color: AppColors.whitecolor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: AppColors.yellocolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<ResetPasswordBloc>().add(
                          ResetPasswordButtonPressed(
                            oldPassword: oldPasswordController.text,
                            newPassword: newPasswordController.text,
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Reset Password",
                      style: Fontspath.w400Inter20(color: AppColors.graycolor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}