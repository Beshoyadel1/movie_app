// Bloc Logic
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/UI/Navigationbar/HomeNavigationbar.dart';
import 'package:movie_app/bloc/LoginBloc/login_event.dart';
import 'package:movie_app/bloc/LoginBloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted); // Register event handler here
  }

  // Event handler for LoginSubmitted
  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    await Future.delayed(Duration(seconds: 2));

    if (event.email.contains("@gmail.com") && event.password.isNotEmpty) {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure("Invalid email or password"));
    }
  }
}
