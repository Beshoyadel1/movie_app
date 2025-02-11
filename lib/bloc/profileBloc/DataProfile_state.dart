abstract class DataProfileState {
  const DataProfileState();
}

class ProfileLoading extends DataProfileState {}

class ProfileUpdated extends DataProfileState {
  final String name;
  final String phoneNumber;
  final int avatarId; // Change to int

  ProfileUpdated(this.name, this.phoneNumber, this.avatarId);
}

class ProfileSavedSuccess extends DataProfileState {}

class ProfileError extends DataProfileState {
  final String message;
  ProfileError(this.message);
}
