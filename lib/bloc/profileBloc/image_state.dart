abstract class ImageState {
  const ImageState();
}

class ImageInitial extends ImageState {}

class ImageSelected extends ImageState {
  final String selectedImage;
  const ImageSelected(this.selectedImage);
}
