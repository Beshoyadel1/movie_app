import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/profileBloc/image_event.dart';
import 'package:movie_app/bloc/profileBloc/image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial()) {
    // Handle SelectImage event
    on<SelectImage>((event, emit) {
      // Emit the new selected image state
      emit(ImageSelected(event.imagePath));
    });
  }
}
