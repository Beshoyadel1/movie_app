class SigninResponse {
  SigninResponse({
      this.message, 
      this.data,});

  SigninResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'];
  }
  String? message;
  String? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}