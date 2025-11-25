class QuestionModel {
  String? id;
  String questionText;
  String answer;

  QuestionModel({
    this.id,
    required this.questionText,
    required this.answer,
  });

  Map<String, dynamic> toJson() => {
    "question_text": questionText,
    "answer": answer,
  };
}

class QuizModel {
  String quizName;
  List<QuestionModel> questions;

  QuizModel({
    required this.quizName,
    required this.questions,
  });

  Map<String, dynamic> toJson() => {
    "quiz_name": quizName,
    "questions": questions.map((e) => e.toJson()).toList(),
  };
}
