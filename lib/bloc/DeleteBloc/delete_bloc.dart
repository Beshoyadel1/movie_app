import 'package:bloc/bloc.dart';
import 'package:movie_app/api/Signin%20Api/LoginRepository.dart';
import 'package:movie_app/bloc/DeleteBloc/delete_event.dart';
import 'package:movie_app/bloc/DeleteBloc/delete_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  final LoginRepository repository;
  DeleteAccountBloc(this.repository) : super(DeleteAccountInitial()) {
    on<DeleteAccountRequested>((event, emit) async {
      emit(DeleteAccountLoading());
      try {
        bool success = await repository.deleteAccount(event.token);
        if (success) {
          // Clear token on successful deletion
          final prefs = await SharedPreferences.getInstance();
          await prefs.remove('auth_token');
          emit(DeleteAccountSuccess());
        } else {
          emit(DeleteAccountFailure("Failed to delete account"));
        }
      } catch (e) {
        emit(DeleteAccountFailure("An error occurred: $e"));
      }
    });
  }
}