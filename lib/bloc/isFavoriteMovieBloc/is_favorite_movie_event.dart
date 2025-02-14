import 'package:equatable/equatable.dart';

abstract class IsFavEvent extends Equatable {
@override
List<Object> get props => [];
}

class CheckFavoriteStatusEvent extends IsFavEvent {
final String movieId;

CheckFavoriteStatusEvent(this.movieId);

@override
List<Object> get props => [movieId];
}

