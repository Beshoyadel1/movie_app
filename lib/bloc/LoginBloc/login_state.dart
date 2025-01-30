abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});
}

class EmailValid extends LoginState {}

class EmailInvalid extends LoginState {}

class PasswordValid extends LoginState {}

class PasswordInvalid extends LoginState {}
