import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/UI/Navigationbar/HomeNavigationbar.dart';
import 'package:movie_app/bloc/LoginBloc/login_event.dart';
import 'package:movie_app/bloc/LoginBloc/login_state.dart';
import 'package:movie_app/bloc/createAccountBloc/create_account_event.dart';
import 'package:movie_app/bloc/createAccountBloc/create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEventSubmitted, CreateAccountState> {
  CreateAccountBloc() : super(CreateAccountInitial()) {
    on<CreateAccountEventSubmitted>(_CreateAccountSubmitted); // Register event handler here
  }

  // Event handler for CreateAccountSubmitted
  Future<void> _CreateAccountSubmitted(CreateAccountEventSubmitted event, Emitter<CreateAccountState> emit) async {
    emit(CreateAccountLoading());
    await Future.delayed(Duration(seconds: 2));

    if (event.email.contains("@gmail.com") && event.password.isNotEmpty && event.Repassword.isNotEmpty && event.name.isNotEmpty&&event.phoneNumber.isNotEmpty) {
      emit(CreateAccountSuccess());
    } else {
      emit(CreateAccountFailure("Invalid email or password or name or phone"));
    }
  }
}
