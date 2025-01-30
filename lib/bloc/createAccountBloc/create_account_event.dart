abstract class LoginEvent {}
class CreateAccountEventSubmitted extends LoginEvent {
  final String email;
  final String password;
  final String Repassword;
  final String name;
  final String phoneNumber;

  CreateAccountEventSubmitted(this.email, this.password,this.name,this.phoneNumber,this.Repassword);
}