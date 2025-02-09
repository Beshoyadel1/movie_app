class SigninResponse {
  SigninResponse({
      this.message, 
      this.token,});

  SigninResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['data'];
  }
  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['data'] = token;
    return map;
  }
}