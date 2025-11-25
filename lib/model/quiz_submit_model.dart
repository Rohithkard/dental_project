class QuizSubmitData {
  int totalQuestions;
  int attended;
  int correct;
  int wrong;
  int marks;
  bool passed;
  int attemptId;

  QuizSubmitData({
    required this.totalQuestions,
    required this.attended,
    required this.correct,
    required this.wrong,
    required this.marks,
    required this.passed,
    required this.attemptId,
  });

  factory QuizSubmitData.fromJson(Map<String, dynamic> json) {
    return QuizSubmitData(
      totalQuestions: json["total_questions"],
      attended: json["attended"],
      correct: json["correct"],
      wrong: json["wrong"],
      marks: json["marks"],
      passed: json["passed"],
      attemptId: json["attempt_id"],
    );
  }
}
