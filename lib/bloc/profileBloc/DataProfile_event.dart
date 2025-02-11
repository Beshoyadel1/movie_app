abstract class DataProfileEvent {}

class LoadProfile extends DataProfileEvent {}

class UpdateAvatarId extends DataProfileEvent { // Change name and type
  final int avatarId;
  UpdateAvatarId(this.avatarId);
}

class UpdateName extends DataProfileEvent {
  final String name;
  UpdateName(this.name);
}

class UpdatePhoneNumber extends DataProfileEvent {
  final String phoneNumber;
  UpdatePhoneNumber(this.phoneNumber);
}

class SaveProfile extends DataProfileEvent {}  // Save profile event
