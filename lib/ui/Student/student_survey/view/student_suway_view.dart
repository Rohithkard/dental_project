import 'package:dental_surway/model/quiz_submit_model.dart' as m;
import 'package:dental_surway/ui/Student/student_survey/bind/student_surway_bind.dart';
import 'package:dental_surway/utls/common_widgets.dart';
import 'package:dental_surway/utls/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentSurveyView extends StatelessWidget {
  StudentSurveyView({super.key});

  final controller = Get.put(StudentSurwayController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.quiz.value == null) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }

      final quiz = controller.quiz.value!;
      final int sectionIndex = controller.currentIndex.value;
      final question = quiz.questions[sectionIndex];

      return Scaffold(
        backgroundColor: const Color(0xFFE9F0FF),

        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Text(
                  "Welcome ${controller.profileModelClass?.data?.name ?? ''}",
                  style: GoogleFonts.rubik(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0A61FF),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "ID: ${controller.profileModelClass?.data?.id ?? ''}",
                  style: GoogleFonts.rubik(color: Colors.grey),
                ),

                const SizedBox(height: 20),

                // Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title = quiz name
                      Text(
                        quiz.quizName,
                        style: GoogleFonts.rubik(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),

                      Text(
                        "Question ${sectionIndex + 1} of ${quiz.questions.length}",
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Progress bar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          minHeight: 6,
                          value: (sectionIndex + 1) / quiz.questions.length,
                          backgroundColor: Colors.grey.shade300,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFF0A61FF),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Single Question (mapped)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question.question,
                              style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 12),

                            Row(
                              children: [
                                AnswerButton(
                                  label: "Yes",
                                  selected:
                                      controller.answers[sectionIndex] == "yes",
                                  onTap: () => controller.selectAnswer(
                                    sectionIndex,
                                    "yes",
                                  ),
                                ),
                                AnswerButton(
                                  label: "No",
                                  selected:
                                      controller.answers[sectionIndex] == "no",
                                  onTap: () => controller.selectAnswer(
                                    sectionIndex,
                                    "no",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Navigation Buttons
                      Row(
                        children: [
                          if (sectionIndex > 0)
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: controller.prevQuestion,
                                child: Text(
                                  "◀ Previous",
                                  style: GoogleFonts.rubik(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF0A61FF),
                                  ),
                                ),
                              ),
                            ),

                          if (sectionIndex > 0) const SizedBox(width: 12),

                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0A61FF),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),

                              onPressed: () {
                                if (sectionIndex == quiz.questions.length - 1) {
                                  controller.submitFinalQuiz();
                                } else {
                                  controller.nextQuestion();
                                }
                              },

                              child: Text(
                                sectionIndex == quiz.questions.length - 1
                                    ? "Submit ▶"
                                    : "Next ▶",
                                style: GoogleFonts.rubik(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Pagination Dots
                _indicatorDots(controller, quiz.questions.length),
              ],
            ),
          ),
        ),
      );
    });
  }

  // Updated dots indicator
  Widget _indicatorDots(StudentSurwayController c, int total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        total,
        (index) => Container(
          width: 28,
          height: 6,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: c.currentIndex.value == index
                ? const Color(0xFF0A61FF)
                : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}

void showQuizResultPopup(m.Data? data) {
  final double scorePercent =
      ((data?.correct??0) / (data?.totalQuestions??0)) * 100;

  Color scoreColor;
  String scoreStatus;

  if (scorePercent >= 80) {
    scoreColor = Colors.green;
    scoreStatus = "Excellent";
  } else if (scorePercent >= 60) {
    scoreColor = Colors.blue;
    scoreStatus = "Good";
  } else if (scorePercent >= 40) {
    scoreColor = Colors.orange;
    scoreStatus = "Fair";
  } else {
    scoreColor = Colors.red;
    scoreStatus = "Poor / Bad";
  }

  String recommendation = (data?.passed??false)
      ? "Keep up the good dental health! 👍"
      : "Immediate dental consultation recommended";

  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 350,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "Survey Result",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 15),

              // ===== Score Card =====
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 8, spreadRadius: 1)
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "${data?.marks??0}",
                      style: TextStyle(
                        color: scoreColor,
                        fontSize: 55,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: scoreColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        scoreStatus,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 13),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      recommendation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: scoreColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ===== Score Breakdown =====
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Score Breakdown",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900)),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _scoreItem("Problems Present", data?.wrong??0),
                        _scoreItem("Problems Absent", data?.correct??0),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () => Get.offAllNamed(Routes.studentNavPage),
                  child: const Text("Done"),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _scoreItem(String title, int value) {
  return Column(
    children: [
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 6),
      Text(
        "$value",
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.w700),
      ),
    ],
  );
}


Widget columnScore(String title, int value) {
  return Column(
    children: [
      Text(title),
      const SizedBox(height: 6),
      Text(
        "$value",
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      ),
    ],
  );
}
