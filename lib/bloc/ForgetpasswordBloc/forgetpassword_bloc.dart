// Bloc Logic
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/UI/Navigationbar/HomeNavigationbar.dart';
import 'package:movie_app/bloc/ForgetpasswordBloc/forgetpassword_event.dart';
import 'package:movie_app/bloc/ForgetpasswordBloc/forgetpassword_state.dart';
import 'package:movie_app/bloc/LoginBloc/login_event.dart';
import 'package:movie_app/bloc/LoginBloc/login_state.dart';

class ForgetpasswordBloc extends Bloc<ForgetpasswordEvent, ForgetpasswordState> {
  ForgetpasswordBloc() : super(ForgetpasswordInitial()) {
    on<ForgetpasswordSubmitted>(_ForgetpasswordSubmitted); // Register event handler here
  }

  // Event handler for LoginSubmitted
  Future<void> _ForgetpasswordSubmitted(ForgetpasswordSubmitted event, Emitter<ForgetpasswordState> emit) async {
    emit(ForgetpasswordLoading());
    await Future.delayed(Duration(seconds: 2));

    if (event.email.contains("@gmail.com")) {
      emit(ForgetpasswordSuccess());
    } else {
      emit(ForgetpasswordFailure("Invalid email"));
    }
  }
}
