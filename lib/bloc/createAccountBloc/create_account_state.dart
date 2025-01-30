abstract class CreateAccountState {}
class CreateAccountInitial extends CreateAccountState {}
class CreateAccountLoading extends CreateAccountState {}
class CreateAccountSuccess extends CreateAccountState {}
class CreateAccountFailure extends CreateAccountState {
  final String error;
  CreateAccountFailure(this.error);
}