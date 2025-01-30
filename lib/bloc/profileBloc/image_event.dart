abstract class ImageEvent {}

class SelectImage extends ImageEvent {
  final String imagePath;
  SelectImage(this.imagePath);
}
