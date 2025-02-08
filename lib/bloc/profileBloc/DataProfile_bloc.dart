import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_event.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_event.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_state.dart';

class DataProfileBloc extends Bloc<DataProfileEvent, DataProfileState> {
  DataProfileBloc() : super(ProfileUpdated('Momen', '0120000', 'images/face1.png')) {

    on<UpdateImage>((event, emit) {
      if (state is ProfileUpdated) {
        final currentState = state as ProfileUpdated;
        emit(ProfileUpdated(currentState.name, currentState.phoneNumber, event.imagePath));
      }
    });
    on<UpdateName>((event, emit) {
      if (state is ProfileUpdated) {
        final currentState = state as ProfileUpdated;
        emit(ProfileUpdated(event.name, currentState.phoneNumber, currentState.selectedImage));
      }
    });
    on<UpdatePhoneNumber>((event, emit) {
      if (state is ProfileUpdated) {
        final currentState = state as ProfileUpdated;
        emit(ProfileUpdated(currentState.name, event.phoneNumber, currentState.selectedImage));
      }
    });
  }
}