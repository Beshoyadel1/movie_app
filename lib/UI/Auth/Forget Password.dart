
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/UI/Auth/login.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:movie_app/bloc/ForgetpasswordBloc/forgetpassword_bloc.dart';
import 'package:movie_app/bloc/ForgetpasswordBloc/forgetpassword_event.dart';
import 'package:movie_app/bloc/ForgetpasswordBloc/forgetpassword_state.dart';
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
  final _formKey = GlobalKey<FormState>();

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
      body: BlocConsumer<ForgetpasswordBloc,ForgetpasswordState>(
        listener: (context, state) {
      if (state is ForgetpasswordSuccess) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Forgetpassword successful!')),
        );

        // Navigate to HomeNavigationbar after a short delay
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacementNamed(context, login.RouteName);
        });
      }
      if (state is ForgetpasswordFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.error)),
        );
      }
    },
    builder: (context, state) {
          return  SingleChildScrollView(
          child: Form(
            key: _formKey,
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
            child:TextFormField(
            style: TextStyle(color: AppColors.whitecolor),
            controller: _emailController,
              validator: (value) => value!.contains("@gmail.com") ? null : "Enter a valid Gmail",
              decoration: InputDecoration(
            fillColor: AppColors.graycolor,
            filled: true,
            labelText:AppLocalizations.of(context)!.email,
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
                        BlocProvider.of<ForgetpasswordBloc>(context).add(
                          ForgetpasswordSubmitted(_emailController.text),
                        );
                      }
                    },
                    child: state is ForgetpasswordLoading ? CircularProgressIndicator() : Text(AppLocalizations.of(context)!.verify_email,style: Fontspath.w400Inter20(color: AppColors.graycolor),)),
                ),
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
