import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/api/Signin%20Api/LoginRepository.dart';
import 'package:movie_app/bloc/ResetPasswordBloc/reset_password_state.dart';
import 'package:movie_app/bloc/resetpasswordBloc/reset_password_event.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final LoginRepository loginRepository;

  ResetPasswordBloc({required this.loginRepository}) : super(ResetPasswordInitial()) {
    on<ResetPasswordButtonPressed>(_onResetPassword);
  }

  Future<void> _onResetPassword(
      ResetPasswordButtonPressed event,
      Emitter<ResetPasswordState> emit,
      ) async {
    emit(ResetPasswordLoading());

    try {
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('auth_token');

      if (token == null) {
        emit(ResetPasswordFailure(error: "User not authenticated. Please log in."));
        return;
      }

      bool success = await loginRepository.resetPassword(
        token,
        event.oldPassword,
        event.newPassword,
      );

      if (success) {
        emit(ResetPasswordSuccess());
      } else {
        emit(ResetPasswordFailure(error:"Failed to reset password"));
      }
    } catch (e) {
      emit(ResetPasswordFailure(error:"An error occurred: $e"));
    }
  }
}
