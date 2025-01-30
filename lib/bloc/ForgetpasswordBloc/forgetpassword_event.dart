abstract class ForgetpasswordEvent {}
class ForgetpasswordSubmitted extends ForgetpasswordEvent {
  final String email;
  ForgetpasswordSubmitted(this.email);
}