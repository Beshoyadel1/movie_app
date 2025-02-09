import 'package:equatable/equatable.dart';

abstract class DeleteAccountEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DeleteAccountRequested extends DeleteAccountEvent {
  final String token;
  DeleteAccountRequested(this.token);
}
