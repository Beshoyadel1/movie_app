abstract class DataProfileState {
  const DataProfileState();
}

class ImageInitial extends DataProfileState {}

class ImageSelectedDataProfile extends DataProfileState {
  final String selectedImage;
  ImageSelectedDataProfile(this.selectedImage);
}

class ProfileUpdated extends DataProfileState {
  final String name;
  final String phoneNumber;

  ProfileUpdated(this.name, this.phoneNumber);
}
