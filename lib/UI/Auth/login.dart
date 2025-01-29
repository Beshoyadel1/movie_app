import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/UI/Auth/CreateAccount.dart';
import 'package:movie_app/UI/Auth/Forget%20Password.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:movie_app/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class login extends StatefulWidget {
  static const String RouteName='login';

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _emailError = false;
  bool _passwordError = false;
  void _validateInput() async {
    setState(() {
      _emailError = _emailController.text.isEmpty || !_emailController.text.contains('@gmail.com');
      _passwordError = _passwordController.text.isEmpty;
    });

    if (!_emailError && !_passwordError) {
      _showMessage('Login Successful!');
      //Navigator.pushNamed(context, Navigationbar.RouteName);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var providerlanguage=Provider.of<Applanguageprovider>(context);
    return Scaffold(
      backgroundColor: AppColors.blackcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(ImagePath.logo,height: height*0.3,),
              TextField(
                style: TextStyle(color: AppColors.whitecolor),
                controller: _emailController,
                decoration: InputDecoration(
                 fillColor: AppColors.graycolor,
                  filled: true,
                  labelText: AppLocalizations.of(context)!.email,
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
            SizedBox(
              height: height*0.02,
            ),
              TextField(
                style: TextStyle(color: AppColors.whitecolor),
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  fillColor: AppColors.graycolor,
                  filled: true,
                  errorText: _passwordError ? 'Please enter a password' : null,
                  labelText: AppLocalizations.of(context)!.password,
                  prefixIcon:Image.asset(ImagePath.password),
                  labelStyle: TextStyle(
                      color: AppColors.whitecolor
                  ),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },icon:Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ),
              SizedBox(
                height: height*0.02,
              ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, Forget_Password.RouteName);
                },
                child: Text(
                  AppLocalizations.of(context)!.forget_password,textAlign: TextAlign.right,
                  style: Fontspath.w400Inter14(color: AppColors.yellocolor),
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
                    onPressed: _validateInput,
                    child: Text(AppLocalizations.of(context)!.login,style: Fontspath.w400Inter20(color: AppColors.graycolor),)),
              ),
              SizedBox(
                height: height*0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.dont_have_account,style: Fontspath.w500Inter16(color: AppColors.whitecolor),),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context,CreateAccount.RouteName);
                    },
                    child: Text(AppLocalizations.of(context)!.create_account,style: Fontspath.w400Inter14(color: AppColors.yellocolor),
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: height*0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width*0.3, // Set a specific width for the left line
                    child: Divider(
                      color: AppColors.yellocolor,
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8), // Adjust spacing
                    child: Text(
                      AppLocalizations.of(context)!.or,
                      style: TextStyle(
                        fontSize: 14,  // Smaller font size
                        color: AppColors.yellocolor,
                      ),
                    ),
                  ),
                  Container(
                    width: width*0.3, // Set a specific width for the right line
                    child: Divider(
                      color: AppColors.yellocolor,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height*0.02,
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
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImagePath.google),
                        SizedBox(width: 10,),
                        Text(AppLocalizations.of(context)!.login_with_google,style: Fontspath.w500Inter20(color: AppColors.graycolor),),
                      ],
                    )),

              ),
              SizedBox(
                height: height*0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: AppColors.yellocolor,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            providerlanguage.chagelanguage('en');
                            setState(() {

                            });
                          },
                          child: Image.asset(
                            ImagePath.usa,
                          ),
                        ),
                        SizedBox(width: 15), // Adjust spacing between the flags
                        InkWell(
                          onTap: (){
                            providerlanguage.chagelanguage('ar');
                            setState(() {

                            });
                          },
                          child: Image.asset(
                            ImagePath.egypt,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
