
class QuizAdminModelClass {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  QuizAdminModelClass({this.success, this.message, this.instance, this.data});

  QuizAdminModelClass.fromJson(Map<String, dynamic> json) {
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
  List<Attempts>? attempts;
  int? totalCount;
  int? limit;

  Data({this.attempts, this.totalCount, this.limit});

  Data.fromJson(Map<String, dynamic> json) {
    attempts = json["attempts"] == null ? null : (json["attempts"] as List).map((e) => Attempts.fromJson(e)).toList();
    totalCount = json["total_count"];
    limit = json["limit"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(attempts != null) {
      _data["attempts"] = attempts?.map((e) => e.toJson()).toList();
    }
    _data["total_count"] = totalCount;
    _data["limit"] = limit;
    return _data;
  }
}

class Attempts {
  int? attemptId;
  Student? student;
  Quiz? quiz;
  Summary? summary;
  List<Answers>? answers;

  Attempts({this.attemptId, this.student, this.quiz, this.summary, this.answers});

  Attempts.fromJson(Map<String, dynamic> json) {
    attemptId = json["attempt_id"];
    student = json["student"] == null ? null : Student.fromJson(json["student"]);
    quiz = json["quiz"] == null ? null : Quiz.fromJson(json["quiz"]);
    summary = json["summary"] == null ? null : Summary.fromJson(json["summary"]);
    answers = json["answers"] == null ? null : (json["answers"] as List).map((e) => Answers.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["attempt_id"] = attemptId;
    if(student != null) {
      _data["student"] = student?.toJson();
    }
    if(quiz != null) {
      _data["quiz"] = quiz?.toJson();
    }
    if(summary != null) {
      _data["summary"] = summary?.toJson();
    }
    if(answers != null) {
      _data["answers"] = answers?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Answers {
  int? questionId;
  String? questionText;
  String? correctAnswer;
  String? studentAnswer;
  bool? isCorrect;

  Answers({this.questionId, this.questionText, this.correctAnswer, this.studentAnswer, this.isCorrect});

  Answers.fromJson(Map<String, dynamic> json) {
    questionId = json["question_id"];
    questionText = json["question_text"];
    correctAnswer = json["correct_answer"];
    studentAnswer = json["student_answer"];
    isCorrect = json["is_correct"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["question_id"] = questionId;
    _data["question_text"] = questionText;
    _data["correct_answer"] = correctAnswer;
    _data["student_answer"] = studentAnswer;
    _data["is_correct"] = isCorrect;
    return _data;
  }
}

class Summary {
  int? totalQuestions;
  int? correct;
  int? wrong;
  int? score;
  bool? passed;
  String? completedAt;

  Summary({this.totalQuestions, this.correct, this.wrong, this.score, this.passed, this.completedAt});

  Summary.fromJson(Map<String, dynamic> json) {
    totalQuestions = json["total_questions"];
    correct = json["correct"];
    wrong = json["wrong"];
    score = json["score"];
    passed = json["passed"];
    completedAt = json["completed_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total_questions"] = totalQuestions;
    _data["correct"] = correct;
    _data["wrong"] = wrong;
    _data["score"] = score;
    _data["passed"] = passed;
    _data["completed_at"] = completedAt;
    return _data;
  }
}

class Quiz {
  int? id;
  String? name;

  Quiz({this.id, this.name});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}

class Student {
  String? id;
  String? name;
  String? email;
  String? phone;

  Student({this.id, this.name, this.email, this.phone});

  Student.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["phone"] = phone;
    return _data;
  }
}