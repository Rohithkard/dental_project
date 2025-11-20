
class ProfileModelClass {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  ProfileModelClass({this.success, this.message, this.instance, this.data});

  ProfileModelClass.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? phone;
  String? email;
  String? code;
  int? status;
  dynamic age;
  dynamic bloodGroup;
  dynamic pincode;
  dynamic thaluk;
  dynamic district;
  dynamic state;
  dynamic country;
  dynamic address;
  String? gender;
  dynamic dateOfBirth;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.name, this.phone, this.email, this.code, this.status, this.age, this.bloodGroup, this.pincode, this.thaluk, this.district, this.state, this.country, this.address, this.gender, this.dateOfBirth, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    phone = json["phone"];
    email = json["email"];
    code = json["code"];
    status = json["status"];
    age = json["age"];
    bloodGroup = json["blood_group"];
    pincode = json["pincode"];
    thaluk = json["thaluk"];
    district = json["district"];
    state = json["state"];
    country = json["country"];
    address = json["address"];
    gender = json["gender"];
    dateOfBirth = json["date_of_birth"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["phone"] = phone;
    _data["email"] = email;
    _data["code"] = code;
    _data["status"] = status;
    _data["age"] = age;
    _data["blood_group"] = bloodGroup;
    _data["pincode"] = pincode;
    _data["thaluk"] = thaluk;
    _data["district"] = district;
    _data["state"] = state;
    _data["country"] = country;
    _data["address"] = address;
    _data["gender"] = gender;
    _data["date_of_birth"] = dateOfBirth;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}