import 'package:dental_surway/ui/questions/bind/questions_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class AddQuestionSheet extends StatelessWidget {
  AddQuestionSheet({super.key});

  final controller = Get.find<QuestionsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Obx(() => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Add New Question",
                    style: GoogleFonts.rubik(
                        fontSize: 20, fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.close, size: 26))
              ],
            ),

            const SizedBox(height: 6),
            Text(
              "Create a new survey question",
              style: GoogleFonts.rubik(
                  color: Colors.grey[600], fontSize: 14),
            ),

            const SizedBox(height: 24),

            Text("Question Text",
                style: GoogleFonts.rubik(fontWeight: FontWeight.w500)),
            const SizedBox(height: 6),
            TextField(
              controller: controller.questionText,
              decoration: inputDecoration("Enter question"),
            ),

            const SizedBox(height: 16),

            Text("Answer (Yes/No or Option)",
                style: GoogleFonts.rubik(fontWeight: FontWeight.w500)),
            const SizedBox(height: 6),
            TextField(
              controller: controller.answerText,
              decoration: inputDecoration("Enter answer"),
            ),

            const SizedBox(height: 20),
            _previewAddedQuestions(),

            const SizedBox(height: 10),

            _primaryButton("Add More", () {
              controller.addLocalQuestion();
            }),

            const SizedBox(height: 12),

            controller.createdQuestions.isEmpty
                ? const SizedBox()
                : _primaryButton("Submit to Quiz", () {
              controller.addMoreQuestions(quizId: 1);
            }),

            const SizedBox(height: 10),

            Center(
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Text("Cancel",
                    style: GoogleFonts.rubik(
                        color: Colors.blue, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      )),
    );
  }

  Widget _previewAddedQuestions() {
    if (controller.createdQuestions.isEmpty) {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Added Questions",
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 8),
        ...controller.createdQuestions.map((q) => Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                  child: Text(q.questionText,
                      style: GoogleFonts.rubik(fontSize: 14))),
              Text(q.answer,
                  style: GoogleFonts.rubik(
                      fontSize: 13, color: Colors.deepPurple)),
            ],
          ),
        )),
      ],
    );
  }

  Widget _primaryButton(String label, Function() onTap) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0A61FF),
          padding: const EdgeInsets.symmetric(vertical: 13),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onTap,
        child: Text(label,
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w500, color: Colors.white)),
      ),
    );
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFF7F8F9),
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
          const BorderSide(color: Color(0xFFE8ECF4))),
    );
  }
}
