
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/UI/Auth/login.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:movie_app/providers/language_provider.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatefulWidget {
  static const String RouteName = 'CreateAccount';

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _RepasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isRePasswordVisible = false;
  bool _nameError = false;
  bool _emailError = false;
  bool _passwordError = false;
  bool _RepasswordError = false;
  bool _phoneNumberError = false;

  // Function to create a new account with Firebase Authentication
  Future<void> _createAccountWithEmailPassword() async {
    setState(() {
      _nameError = _nameController.text.isEmpty;
      _emailError = _emailController.text.isEmpty || !_emailController.text.contains('@gmail.com');
      _passwordError = _passwordController.text.isEmpty || (_passwordController.text != _RepasswordController.text);
      _RepasswordError = _RepasswordController.text.isEmpty || (_passwordController.text != _RepasswordController.text);
      _phoneNumberError=_phoneNumberController.text.isEmpty;
    });

    if (!_emailError && !_passwordError && !_nameError && !_RepasswordError&&!_phoneNumberError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Account created successfully ')),
      );
      Navigator.pushNamed(context, login.RouteName);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var providerlanguage=Provider.of<Applanguageprovider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackcolor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.create_account,
          style: Fontspath.w400Inter20(color: AppColors.yellocolor),
        ),
      ),
      backgroundColor: AppColors.blackcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: height*0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Image.asset(ImagePath.register1),
                  Image.asset(ImagePath.register2),
                  Image.asset(ImagePath.register3)
                ],
              ),
              SizedBox(
                height: height*0.02,
              ),
              Text('Avatar',style: Fontspath.w400Inter14(color: AppColors.whitecolor),textAlign: TextAlign.center,),
              SizedBox(
                height: height*0.02,
              ),
              Container(
                //padding: EdgeInsets.all(20),
                child:TextField(
                  style: TextStyle(color: AppColors.whitecolor),
                  controller: _nameController,
                  decoration: InputDecoration(
                    fillColor: AppColors.graycolor,
                    filled: true,
                    labelText: AppLocalizations.of(context)!.name,
                    prefixIcon:Image.asset(ImagePath.name),
                    labelStyle: TextStyle(
                        color: AppColors.whitecolor
                    ),
                    errorText: _nameError ? 'Please enter a valid name' : null,
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
                //padding: EdgeInsets.all(20),
                child:TextField(
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
              ),
              SizedBox(
                height: height*0.02,
              ),
              Container(
                // padding: EdgeInsets.all(20),
                child:TextField(
                  style: TextStyle(color: AppColors.whitecolor),
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    fillColor: AppColors.graycolor,
                    filled: true,
                    errorText: _passwordError != _RepasswordError
                        ? 'Password and Repassword do not match'
                        : (_passwordError ? 'Please enter a valid password' : null),
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
              ),

              SizedBox(
                height: height*0.02,
              ),
              Container(
                // padding: EdgeInsets.all(20),
                child:TextField(
                  style: TextStyle(color: AppColors.whitecolor),
                  controller: _RepasswordController,
                  obscureText: !_isRePasswordVisible,
                  decoration: InputDecoration(
                    fillColor: AppColors.graycolor,
                    filled: true,
                    errorText: _passwordError != _RepasswordError
                        ? 'Password and Repassword do not match'
                        : (_passwordError ? 'Please enter a valid password' : null),                    labelText: AppLocalizations.of(context)!.password,
                    prefixIcon:Image.asset(ImagePath.password),
                    labelStyle: TextStyle(
                        color: AppColors.whitecolor
                    ),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        _isRePasswordVisible = !_isRePasswordVisible;
                      });
                    },icon:Icon(
                      _isRePasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    ),
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
                //padding: EdgeInsets.all(20),
                child:TextField(
                  style: TextStyle(color: AppColors.whitecolor),
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    fillColor: AppColors.graycolor,
                    filled: true,
                    labelText:'Phone Number',
                    prefixIcon:Image.asset(ImagePath.phone),
                    labelStyle: TextStyle(
                        color: AppColors.whitecolor
                    ),
                    errorText: _phoneNumberError ? 'Please enter a valid Phone Number' : null,
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
                      onPressed: _createAccountWithEmailPassword();
                    },
                    child: Text(AppLocalizations.of(context)!.create_account,style: Fontspath.w400Inter20(color: AppColors.graycolor),)),
              ),
              SizedBox(
                height: height*0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.dont_have_account,style: Fontspath.w500Inter16(color: AppColors.whitecolor),),
                  SizedBox(
                    width: width*0.02,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context,login.RouteName);
                    },
                    child: Text(AppLocalizations.of(context)!.login,style: Fontspath.w400Inter14(color: AppColors.yellocolor),
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
