abstract class DataProfileEvent {}

class UpdateImage extends DataProfileEvent {
  final String imagePath;
  UpdateImage(this.imagePath);
}

class UpdateName extends DataProfileEvent {
  final String name;
  UpdateName(this.name);
}

class UpdatePhoneNumber extends DataProfileEvent {
  final String phoneNumber;
  UpdatePhoneNumber(this.phoneNumber);
}
