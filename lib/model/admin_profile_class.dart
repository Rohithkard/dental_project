
class ProfileAdminModelClass {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  ProfileAdminModelClass({this.success, this.message, this.instance, this.data});

  ProfileAdminModelClass.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? userName;
  dynamic name;
  dynamic email;
  dynamic phone;
  dynamic designation;
  int? status;
  int? isSuperAdmin;
  String? userType;
  String? createdAt;
  String? updatedAt;
  dynamic permission;

  Data({this.id, this.userName, this.name, this.email, this.phone, this.designation, this.status, this.isSuperAdmin, this.userType, this.createdAt, this.updatedAt, this.permission});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userName = json["user_name"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    designation = json["designation"];
    status = json["status"];
    isSuperAdmin = json["is_super_admin"];
    userType = json["user_type"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    permission = json["permission"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["user_name"] = userName;
    _data["name"] = name;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["designation"] = designation;
    _data["status"] = status;
    _data["is_super_admin"] = isSuperAdmin;
    _data["user_type"] = userType;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["permission"] = permission;
    return _data;
  }
}