
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/UI/Auth/login.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:movie_app/bloc/LanguageBloc/language_bloc.dart';
import 'package:movie_app/bloc/LanguageBloc/language_event.dart';
import 'package:movie_app/bloc/LanguageBloc/language_state.dart';
import 'package:movie_app/bloc/LoginBloc/login_bloc.dart';
import 'package:movie_app/bloc/LoginBloc/login_event.dart';
import 'package:movie_app/bloc/createAccountBloc/create_account_bloc.dart';
import 'package:movie_app/bloc/createAccountBloc/create_account_event.dart';
import 'package:movie_app/bloc/createAccountBloc/create_account_state.dart';
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
  /* Future<void> _createAccountWithEmailPassword() async {
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
  } */

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
   // var providerlanguage=Provider.of<Applanguageprovider>(context);
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
      body: BlocConsumer<CreateAccountBloc, CreateAccountState>(
        listener: (context, state) {
      if (state is CreateAccountSuccess) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('CreateAccount successful!')),
        );

        // Navigate to HomeNavigationbar after a short delay
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacementNamed(context, login.RouteName);
        });
      }
      if (state is CreateAccountFailure) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.error)),
        );
      }
    },
    builder: (context, state) {
          return SingleChildScrollView(
          child: BlocBuilder<LanguageBloc,LanguageState>(
    builder: (context,state){
    return Form(
      key: _formKey,
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
      child:TextFormField(
      style: TextStyle(color: AppColors.whitecolor),
      controller: _nameController,
        validator: (value) => value!.isEmpty ? "Enter name" : null,
        decoration: InputDecoration(
      fillColor: AppColors.graycolor,
      filled: true,
      labelText: AppLocalizations.of(context)!.name,
      prefixIcon:Image.asset(ImagePath.name),
      labelStyle: TextStyle(
      color: AppColors.whitecolor
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
      child:TextFormField(
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
      ),
      SizedBox(
      height: height*0.02,
      ),
      TextFormField(
      style: TextStyle(color: AppColors.whitecolor),
      controller: _passwordController,
        validator: (value) => value!.isEmpty || (_passwordController.text!=_RepasswordController.text) ? "Enter password" : null,
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
      TextFormField(
      style: TextStyle(color: AppColors.whitecolor),
      controller: _RepasswordController,
      obscureText: !_isRePasswordVisible,
        validator: (value) => value!.isEmpty || (_passwordController.text!=_RepasswordController.text)? "Enter password" : null,
        decoration: InputDecoration(
      fillColor: AppColors.graycolor,
      filled: true,
      labelText: AppLocalizations.of(context)!.re_password,
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

      SizedBox(
      height: height*0.02,
      ),
      TextFormField(
      style: TextStyle(color: AppColors.whitecolor),
      controller: _phoneNumberController,
        validator: (value) => value!.isEmpty ? "Enter PhoneNumber" : null,
        decoration: InputDecoration(
      fillColor: AppColors.graycolor,
      filled: true,
      labelText: AppLocalizations.of(context)!.phone_number,
      prefixIcon:Image.asset(ImagePath.phone),
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
              BlocProvider.of<CreateAccountBloc>(context).add(
                CreateAccountEventSubmitted(_emailController.text, _passwordController.text, _nameController.text,
                    _phoneNumberController.text, _RepasswordController.text),
              );
            }
          },
          child: state is CreateAccountLoading ? CircularProgressIndicator() : Text(AppLocalizations.of(context)!.create_account,style: Fontspath.w400Inter20(color: AppColors.graycolor),)),
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
      ),
      ),
      ],
      )

      ],
      ),
      ),
    );
    }
    )
    );
    }
    )
    );
  }
}
