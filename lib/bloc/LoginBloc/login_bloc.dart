import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/LoginBloc/login_event.dart';
import 'package:movie_app/bloc/LoginBloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
  }

  // Handler for LoginButtonPressed event
  Future<void> _onLoginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading()); // Emit loading state before attempting to login

    // Simulate login process (replace with actual logic)
    await Future.delayed(Duration(seconds: 2));

    if (event.email == "test@gmail.com" && event.password == "password") {
      emit(LoginSuccess()); // Emit success if login is successful
    } else {
      emit(LoginFailure(error: "Invalid credentials")); // Emit failure if login fails
    }
  }

  // Handler for EmailChanged event
  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    if (event.email.contains('@gmail.com')) {
      emit(EmailValid()); // Emit valid email state
    } else {
      emit(EmailInvalid()); // Emit invalid email state
    }
  }

  // Handler for PasswordChanged event
  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    if (event.password.isNotEmpty) {
      emit(PasswordValid()); // Emit valid password state
    } else {
      emit(PasswordInvalid()); // Emit invalid password state
    }
  }
}
