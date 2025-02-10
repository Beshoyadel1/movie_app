import 'package:equatable/equatable.dart';

abstract class ResetPasswordEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ResetPasswordButtonPressed extends ResetPasswordEvent {
  final String oldPassword;
  final String newPassword;

  ResetPasswordButtonPressed({required this.oldPassword, required this.newPassword});

  @override
  List<Object> get props => [oldPassword, newPassword];
}
