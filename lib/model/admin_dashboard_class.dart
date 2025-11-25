
class DashboardViewModel {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  DashboardViewModel({this.success, this.message, this.instance, this.data});

  DashboardViewModel.fromJson(Map<String, dynamic> json) {
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
  int? totalStudents;
  int? averageScore;
  int? topScore;
  List<Students>? students;

  Data({this.totalStudents, this.averageScore, this.topScore, this.students});

  Data.fromJson(Map<String, dynamic> json) {
    totalStudents = json["total_students"];
    averageScore = json["average_score"];
    topScore = json["top_score"];
    students = json["students"] == null ? null : (json["students"] as List).map((e) => Students.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total_students"] = totalStudents;
    _data["average_score"] = averageScore;
    _data["top_score"] = topScore;
    if(students != null) {
      _data["students"] = students?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Students {
  String? id;
  String? name;
  String? phone;
  String? email;

  Students({this.id, this.name, this.phone, this.email});

  Students.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    phone = json["phone"];
    email = json["email"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["phone"] = phone;
    _data["email"] = email;
    return _data;
  }
}