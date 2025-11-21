import 'package:dental_surway/ui/Student/student_survey/bind/student_surway_bind.dart';
import 'package:dental_surway/utls/common_widgets.dart';
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
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
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
                  "Welcome Jacob!",
                  style: GoogleFonts.rubik(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0A61FF),
                  ),
                ),
                const SizedBox(height: 2),
                Text("ID: asd", style: GoogleFonts.rubik(color: Colors.grey)),

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
                            fontSize: 14, color: Colors.grey.shade600),
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
                              Color(0xFF0A61FF)),
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
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 12),

                            Row(
                              children: [
                                AnswerButton(
                                  label: "Yes",
                                  selected: controller.answers[sectionIndex] == "yes",
                                  onTap: () => controller.selectAnswer(sectionIndex, "yes"),
                                ),
                                AnswerButton(
                                  label: "No",
                                  selected: controller.answers[sectionIndex] == "no",
                                  onTap: () => controller.selectAnswer(sectionIndex, "no"),
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
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 14),
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
                                      color: const Color(0xFF0A61FF)),
                                ),
                              ),
                            ),

                          if (sectionIndex > 0)
                            const SizedBox(width: 12),

                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0A61FF),
                                padding:
                                const EdgeInsets.symmetric(vertical: 14),
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
                                    color: Colors.white),
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
