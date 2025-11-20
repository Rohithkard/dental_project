
class SignUpModelClass {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  SignUpModelClass({this.success, this.message, this.instance, this.data});

  SignUpModelClass.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    instance = json["instance"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    _data["instance"] = instance;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? userId;
  String? otpKey;
  int? otp;
  String? gender;

  Data({this.userId, this.otpKey, this.otp, this.gender});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json["user_id"];
    otpKey = json["otpKey"];
    otp = json["otp"];
    gender = json["gender"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["user_id"] = userId;
    _data["otpKey"] = otpKey;
    _data["otp"] = otp;
    _data["gender"] = gender;
    return _data;
  }
}