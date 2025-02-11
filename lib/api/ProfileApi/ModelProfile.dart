class ProfileResponse {
  final String? message;
  final UserData? data;

  ProfileResponse({this.message, this.data});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      message: json['message'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }
}

class UserData {
  final String? name;
  final String? phone;
  final int? avatarId;

  UserData({this.name, this.phone, this.avatarId});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      phone: json['phone'],
      avatarId: json['avaterId'], // Fixing typo
    );
  }
}
