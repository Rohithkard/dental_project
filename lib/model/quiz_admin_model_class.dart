
class QuizModelClassAdmin {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  QuizModelClassAdmin({this.success, this.message, this.instance, this.data});

  QuizModelClassAdmin.fromJson(Map<String, dynamic> json) {
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
  List<Quiz>? quiz;
  int? total;
  int? limit;

  Data({this.quiz, this.total, this.limit});

  Data.fromJson(Map<String, dynamic> json) {
    quiz = json["quiz"] == null ? null : (json["quiz"] as List).map((e) => Quiz.fromJson(e)).toList();
    total = json["total"];
    limit = json["limit"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(quiz != null) {
      _data["quiz"] = quiz?.map((e) => e.toJson()).toList();
    }
    _data["total"] = total;
    _data["limit"] = limit;
    return _data;
  }
}

class Quiz {
  int? id;
  String? quizName;
  String? createdAt;
  String? updatedAt;
  List<Questions>? questions;

  Quiz({this.id, this.quizName, this.createdAt, this.updatedAt, this.questions});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    quizName = json["quiz_name"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    questions = json["questions"] == null ? null : (json["questions"] as List).map((e) => Questions.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["quiz_name"] = quizName;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    if(questions != null) {
      _data["questions"] = questions?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Questions {
  int? id;
  String? questionText;
  String? answer;
  String? createdAt;
  String? updatedAt;

  Questions({this.id, this.questionText, this.answer, this.createdAt, this.updatedAt});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    questionText = json["question_text"];
    answer = json["answer"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["question_text"] = questionText;
    _data["answer"] = answer;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}