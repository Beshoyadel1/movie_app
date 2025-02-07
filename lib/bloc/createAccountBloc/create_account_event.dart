abstract class SignupEvent {}

class SignupButtonPressed extends SignupEvent {
  final String name, email, phone, password, confirmPassword;
  final int avaterId;
  SignupButtonPressed({required this.name, required this.email, required this.phone, required this.password, required this.confirmPassword, required this.avaterId});
}