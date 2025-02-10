import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/api/SignupApi/SignupRepository.dart';
import 'package:movie_app/bloc/createAccountBloc/create_account_event.dart';
import 'package:movie_app/bloc/createAccountBloc/create_account_state.dart';


class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupRepository repository;

  SignupBloc(this.repository) : super(SignupInitial()) {
    on<SignupButtonPressed>((event, emit) async {
      emit(SignupLoading());
      try {
        final response = await repository.signup(
            event.name, event.email, '+2${event.phone}', event.password, event.confirmPassword, event.avaterId);
        emit(SignupSuccess(response));
      } catch (e) {
        emit(SignupFailure(e.toString()));
      }
    });
  }
}
