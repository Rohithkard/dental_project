
class QuizSubmitData {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  QuizSubmitData({this.success, this.message, this.instance, this.data});

  QuizSubmitData.fromJson(Map<String, dynamic> json) {
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
  dynamic? totalQuestions;
  dynamic? attended;
  dynamic? correct;
  dynamic? wrong;
  dynamic? marks;
  bool? passed;
  dynamic? attemptId;

  Data({this.totalQuestions, this.attended, this.correct, this.wrong, this.marks, this.passed, this.attemptId});

  Data.fromJson(Map<String, dynamic> json) {
    totalQuestions = json["total_questions"];
    attended = json["attended"];
    correct = json["correct"];
    wrong = json["wrong"];
    marks = json["marks"];
    passed = json["passed"];
    attemptId = json["attempt_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total_questions"] = totalQuestions;
    _data["attended"] = attended;
    _data["correct"] = correct;
    _data["wrong"] = wrong;
    _data["marks"] = marks;
    _data["passed"] = passed;
    _data["attempt_id"] = attemptId;
    return _data;
  }
}