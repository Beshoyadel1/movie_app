import 'package:equatable/equatable.dart';

abstract class DeleteAccountState extends Equatable {
  @override
  List<Object> get props => [];
}

class DeleteAccountInitial extends DeleteAccountState {}
class DeleteAccountLoading extends DeleteAccountState {}
class DeleteAccountSuccess extends DeleteAccountState {}
class DeleteAccountFailure extends DeleteAccountState {
  final String error;
  DeleteAccountFailure(this.error);
}