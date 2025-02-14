import 'package:equatable/equatable.dart';

abstract class removeFavoriteState extends Equatable {
  @override
  List<Object> get props => [];
}

class removeFavoriteInitial extends removeFavoriteState {}

class removeFavoriteLoading extends removeFavoriteState {}

class removeFavoriteSuccess extends removeFavoriteState {
  final String message;

  removeFavoriteSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class removeFavoriteFailure extends removeFavoriteState {
  final String error;

  removeFavoriteFailure(this.error);

  @override
  List<Object> get props => [error];
}
