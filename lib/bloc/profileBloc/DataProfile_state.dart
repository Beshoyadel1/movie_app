abstract class DataProfileState {
  const DataProfileState();
}

class ProfileUpdated extends DataProfileState {
  final String name;
  final String phoneNumber;
  final String selectedImage;
  ProfileUpdated(this.name, this.phoneNumber,this.selectedImage);
}
