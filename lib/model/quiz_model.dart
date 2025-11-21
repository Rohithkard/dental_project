class QuizModel {
  final int id;
  final String quizName;
  final List<QuizQuestion> questions;

  QuizModel({
    required this.id,
    required this.quizName,
    required this.questions,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      id: json["id"],
      quizName: json["quiz_name"],
      questions: (json["questions"] as List)
          .map((q) => QuizQuestion.fromJson(q))
          .toList(),
    );
  }
}

class QuizQuestion {
  final int id;
  final String question;
  final String correctAnswer;

  QuizQuestion({
    required this.id,
    required this.question,
    required this.correctAnswer,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json["id"],
      question: json["question_text"],
      correctAnswer: json["answer"],
    );
  }
}
