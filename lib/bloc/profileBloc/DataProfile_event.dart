abstract class DataProfileEvent {}

class SelectImage extends DataProfileEvent {
  final String imagePath;
  SelectImage(this.imagePath);
}

class UpdateName extends DataProfileEvent {
  final String name;
  UpdateName(this.name);
}

class UpdatePhoneNumber extends DataProfileEvent {
  final String phoneNumber;
  UpdatePhoneNumber(this.phoneNumber);
}
