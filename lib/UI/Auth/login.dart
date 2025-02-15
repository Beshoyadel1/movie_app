import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/UI/Auth/CreateAccount.dart';
import 'package:movie_app/UI/Auth/Forget%20Password.dart';
import 'package:movie_app/UI/Navigationbar/Home/Home_Screen.dart';
import 'package:movie_app/UI/Navigationbar/HomeNavigationbar.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:movie_app/bloc/LanguageBloc/language_bloc.dart';
import 'package:movie_app/bloc/LanguageBloc/language_event.dart';
import 'package:movie_app/bloc/LanguageBloc/language_state.dart';
import 'package:movie_app/bloc/LoginBloc/login_bloc.dart';
import 'package:movie_app/bloc/LoginBloc/login_event.dart';
import 'package:movie_app/bloc/LoginBloc/login_state.dart';
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
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.blackcolor,
      body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              if (context.mounted) {
                Navigator.pushNamed(context, HomeNavigationbar.RouteName);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            } else if (state is LoginFailure) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: AppColors.redcolor,
                  ),
                );
              }
            }
          },          builder: (context, state) {
          return  SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(ImagePath.logo,height: height*0.3,),
                    TextFormField(
                      style: TextStyle(color: AppColors.whitecolor),
                      controller: _emailController,
                      validator: (value) => value!.contains("@gmail.com") ? null : "Enter a valid Gmail",
                      decoration: InputDecoration(
                        fillColor: AppColors.graycolor,
                        filled: true,
                        labelText: AppLocalizations.of(context)!.email,
                        prefixIcon:Image.asset(ImagePath.email),
                        labelStyle: TextStyle(
                            color: AppColors.whitecolor
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height*0.02,
                    ),
                    TextFormField(
                      style: TextStyle(color: AppColors.whitecolor),
                      controller: _passwordController,
                      validator: (value) => value!.isEmpty ? "Enter password" : null,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        fillColor: AppColors.graycolor,
                        filled: true,
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
                    state is LoginLoading
                        ? Center(child: CircularProgressIndicator()):
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              String email = _emailController.text;
                              String password = _passwordController.text;
                              context.read<LoginBloc>().add(
                                LoginButtonPressed(email: email, password: password),
                              );
                            }
                          },
                          child:Text(AppLocalizations.of(context)!.login,style: Fontspath.w400Inter20(color: AppColors.graycolor),)),
                    ),
                    SizedBox(
                      height: height*0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context)!.dont_have_account,style: Fontspath.w500Inter16(color: AppColors.whitecolor)),
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
                          child: SingleChildScrollView(
                            scrollDirection:Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(ImagePath.google),
                                SizedBox(width: 10,),
                                Text(AppLocalizations.of(context)!.login_with_google,style: Fontspath.w500Inter20(color: AppColors.graycolor),),
                              ],
                            ),
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
                          child: BlocBuilder<LanguageBloc,LanguageState>(
                              builder: (context,state){
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        context.read<LanguageBloc>().add(ChangeLanguage('en'));
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
                                        context.read<LanguageBloc>().add(ChangeLanguage('ar'));
                                        setState(() {

                                        });
                                      },
                                      child: Image.asset(
                                        ImagePath.egypt,
                                      ),
                                    ),
                                  ],
                                );
                              }
                          ),
                        )
                      ],
                    )

                  ],
                ),
              ),
            ),
          );
    }
      )
    );
  }
}
