import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/api/Signin%20Api/LoginRepository.dart';
import 'package:movie_app/api/Signin%20Api/ModelSignin.dart';
import 'package:movie_app/bloc/LoginBloc/login_event.dart';
import 'package:movie_app/bloc/LoginBloc/login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository authRepository;

  LoginBloc(this.authRepository) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final SigninResponse response = await authRepository.login(event.email, event.password);

      if (response.message != null && response.message!.toLowerCase().contains("success")) {
        emit(LoginSuccess(message: response.message!));
      } else {
        emit(LoginFailure(error: response.message ?? "Login failed"));
      }
    } catch (e) {
      emit(LoginFailure(error: "An error occurred: $e"));
    }
  }
}
