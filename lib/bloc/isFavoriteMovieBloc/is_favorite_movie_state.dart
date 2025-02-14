// States
import 'package:equatable/equatable.dart';

abstract class IsFavState extends Equatable {
  @override
  List<Object> get props => [];
}

class IsFavInitialState extends IsFavState {}

class IsFavLoadingState extends IsFavState {}

class IsFavSuccessState extends IsFavState {
  final bool isFavorite;

  IsFavSuccessState(this.isFavorite);

  @override
  List<Object> get props => [isFavorite];
}

class IsFavErrorState extends IsFavState {
  final String error;

  IsFavErrorState(this.error);

  @override
  List<Object> get props => [error];
}
