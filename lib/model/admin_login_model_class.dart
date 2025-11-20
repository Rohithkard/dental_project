
class AdminLoginModel {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  AdminLoginModel({this.success, this.message, this.instance, this.data});

  AdminLoginModel.fromJson(Map<String, dynamic> json) {
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
  bool? superAdmin;
  String? id;
  String? apiKey;
  String? userType;

  Data({this.superAdmin, this.id, this.apiKey, this.userType});

  Data.fromJson(Map<String, dynamic> json) {
    superAdmin = json["super_admin"];
    id = json["id"];
    apiKey = json["api_key"];
    userType = json["user_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["super_admin"] = superAdmin;
    _data["id"] = id;
    _data["api_key"] = apiKey;
    _data["user_type"] = userType;
    return _data;
  }
}