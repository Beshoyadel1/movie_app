
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/UI/Auth/login.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:provider/provider.dart';

class Forget_Password extends StatefulWidget {
  static const String RouteName = 'Forget_Password';

  @override
  State<Forget_Password> createState() => _Forget_PasswordState();
}

class _Forget_PasswordState extends State<Forget_Password> {
  TextEditingController emailController = TextEditingController();
  String errorMessage = '';
  final _emailController = TextEditingController();
  bool _emailError = false;

  // Function to handle email verification and reset password
  Future<void> _forgrtpassword() async {
    setState(() {
      _emailError = _emailController.text.isEmpty || !_emailController.text.contains('@gmail.com');
    });

    if (!_emailError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('successfully ')),
      );
      Navigator.pushNamed(context, login.RouteName);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.blackcolor,
      appBar: AppBar(
        backgroundColor: AppColors.blackcolor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.forget_password,
          style: Fontspath.w400Inter20(color: AppColors.yellocolor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(ImagePath.forgetpassword),
              SizedBox(height: 10),
              // Email input field
              Container(
                //padding: EdgeInsets.all(20),
                child:TextField(
                  style: TextStyle(color: AppColors.whitecolor),
                  controller: _emailController,
                  decoration: InputDecoration(
                    fillColor: AppColors.graycolor,
                    filled: true,
                    labelText:AppLocalizations.of(context)!.email,
                    prefixIcon:Image.asset(ImagePath.email),
                    labelStyle: TextStyle(
                        color: AppColors.whitecolor
                    ),
                    errorText: _emailError ? 'Please enter a valid email' : null,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height*0.02,
              ),
              Container(
                // margin: const EdgeInsets.all(10),
                padding:const EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor:AppColors.yellocolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // No rounded corners
                      ),
                    ),
                    onPressed: (){
                      onPressed: _forgrtpassword();
                    },
                    child: Text('Verify Email',style: Fontspath.w400Inter20(color: AppColors.graycolor),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
