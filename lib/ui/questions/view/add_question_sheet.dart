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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),

      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                Expanded(
                  child: Text(
                    "Add New Question",
                    style: GoogleFonts.rubik(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.close, size: 26),
                )
              ],
            ),

            const SizedBox(height: 6),

            Text(
              "Create a new survey question and add it to a question group",
              style: GoogleFonts.rubik(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 24),

            // Group dropdown
            Text("Question Group", style: GoogleFonts.rubik(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),

            Obx(() {
              return DropdownButtonFormField<String>(
                value: controller.selectedGroup.value.isEmpty
                    ? null
                    : controller.selectedGroup.value,
                decoration: dropdownDecoration(),
                items: controller.groups
                    .map((g) => DropdownMenuItem<String>(
                  value: g["title"] as String,
                  child: Text(g["title"] as String),
                ))
                    .toList(),
                onChanged: (value) => controller.selectedGroup.value = value ?? "",
                hint: const Text("Select a group"),
              );
            }),

            const SizedBox(height: 20),

            // Question text
            Text("Question Text", style: GoogleFonts.rubik(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),

            TextField(
              controller: controller.questionText,
              decoration: inputDecoration("Enter your question"),
            ),

            const SizedBox(height: 20),

            // Type dropdown
            Text("Question Type", style: GoogleFonts.rubik(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),

            Obx(() {
              return DropdownButtonFormField<String>(
                value: controller.questionType.value,
                items: controller.questionTypes
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
                decoration: dropdownDecoration(),
                onChanged: (v) => controller.questionType.value = v!,
              );
            }),

            const SizedBox(height: 20),

            // Conditional checkbox
            Obx(() {
              return Row(
                children: [
                  Checkbox(
                    value: controller.conditional.value,
                    onChanged: (v) => controller.conditional.value = v!,
                  ),
                  Text("Show this question conditionally",
                      style: GoogleFonts.rubik(fontSize: 14)),
                ],
              );
            }),

            const SizedBox(height: 12),

            // Add Question Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A61FF),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Add Question",
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Text(
                  "Cancel",
                  style: GoogleFonts.rubik(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFF7F8F9),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
      ),
    );
  }

  InputDecoration dropdownDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFFF7F8F9),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
      ),
    );
  }
}
