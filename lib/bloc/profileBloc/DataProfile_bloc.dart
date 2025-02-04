import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_event.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_state.dart';

class DataProfileBloc extends Bloc<DataProfileEvent, DataProfileState> {
  DataProfileBloc() : super(ProfileUpdated('Momen', '0120000')) {
    on<SelectImage>((event, emit) {
      emit(ImageSelectedDataProfile(event.imagePath));
    });

    on<UpdateName>((event, emit) {
      if (state is ProfileUpdated) {
        emit(ProfileUpdated(event.name, (state as ProfileUpdated).phoneNumber));
      }
    });

    on<UpdatePhoneNumber>((event, emit) {
      if (state is ProfileUpdated) {
        emit(ProfileUpdated((state as ProfileUpdated).name, event.phoneNumber));
      }
    });
  }
}

