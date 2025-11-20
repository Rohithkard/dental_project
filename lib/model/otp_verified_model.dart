
class VerifiedModelClass {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  VerifiedModelClass({this.success, this.message, this.instance, this.data});

  VerifiedModelClass.fromJson(Map<String, dynamic> json) {
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
  String? key;
  String? message;

  Data({this.userId, this.key, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json["user_id"];
    key = json["key"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["user_id"] = userId;
    _data["key"] = key;
    _data["message"] = message;
    return _data;
  }
}