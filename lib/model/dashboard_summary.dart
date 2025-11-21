
class DashboardSummary {
  bool? success;
  String? message;
  String? instance;
  List<Data>? data;

  DashboardSummary({this.success, this.message, this.instance, this.data});

  DashboardSummary.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    instance = json["instance"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    _data["instance"] = instance;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? quizId;
  String? quizName;
  int? totalQuestions;
  int? attended;
  int? notAttended;
  int? correct;
  int? wrong;

  Data({this.quizId, this.quizName, this.totalQuestions, this.attended, this.notAttended, this.correct, this.wrong});

  Data.fromJson(Map<String, dynamic> json) {
    quizId = json["quiz_id"];
    quizName = json["quiz_name"];
    totalQuestions = json["total_questions"];
    attended = json["attended"];
    notAttended = json["not_attended"];
    correct = json["correct"];
    wrong = json["wrong"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["quiz_id"] = quizId;
    _data["quiz_name"] = quizName;
    _data["total_questions"] = totalQuestions;
    _data["attended"] = attended;
    _data["not_attended"] = notAttended;
    _data["correct"] = correct;
    _data["wrong"] = wrong;
    return _data;
  }
}