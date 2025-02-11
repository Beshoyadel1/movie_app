import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/api/Signin%20Api/LoginRepository.dart';
import 'package:movie_app/api/Signin%20Api/ModelSignin.dart';
import 'package:movie_app/bloc/LoginBloc/login_event.dart';
import 'package:movie_app/bloc/LoginBloc/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository authRepository;

  LoginBloc(this.authRepository) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final SigninResponse? response = await authRepository.login(event.email, event.password);

      if (response != null && response.token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', response.token!);
        emit(LoginSuccess(
          message: response.message ?? "Login successful",
          token: response.token!,
        ));
      } else {
        emit(LoginFailure(error: response?.message ?? "Invalid credentials"));
      }
    } catch (e) {
      emit(LoginFailure(error: "An unexpected error occurred. Please try again."));
    }
  }
}
