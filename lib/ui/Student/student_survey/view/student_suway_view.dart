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
      final int sectionIndex = controller.currentSection.value;
      final section = controller.surveySections[sectionIndex];

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

                      // Title
                      Text(
                        section["title"],
                        style: GoogleFonts.rubik(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),

                      Text(
                        "Section ${sectionIndex + 1} of ${controller.surveySections.length}",
                        style: GoogleFonts.rubik(
                            fontSize: 14, color: Colors.grey.shade600),
                      ),

                      const SizedBox(height: 12),

                      // Progress bar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          minHeight: 6,
                          value: (sectionIndex + 1) /
                              controller.surveySections.length,
                          backgroundColor: Colors.grey.shade300,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFF0A61FF)),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Questions
                      ...section["questions"].asMap().entries.map((entry) {
                        int qIndex = entry.key;
                        var q = entry.value;

                        int globalIndex = _globalIndex(sectionIndex, qIndex);

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                q["q"],
                                style: GoogleFonts.rubik(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 12),

                              Row(
                                children: [
                                  AnswerButton(
                                    label: "Yes",
                                    selected:
                                    controller.answers[globalIndex]["value"] ==
                                        "yes",
                                    onTap: () => controller
                                        .selectAnswer(globalIndex, "yes"),
                                  ),
                                  AnswerButton(
                                    label: "No",
                                    selected:
                                    controller.answers[globalIndex]["value"] ==
                                        "no",
                                    onTap: () => controller
                                        .selectAnswer(globalIndex, "no"),
                                  ),
                                ],
                              ),

                              if (q["type"] == "yesno-extra") ...[
                                const SizedBox(height: 12),
                                AnswerButton(
                                  label: "Former user",
                                  selected:
                                  controller.answers[globalIndex]["value"] ==
                                      "former",
                                  onTap: () => controller
                                      .selectAnswer(globalIndex, "former"),
                                ),
                              ]
                            ],
                          ),
                        );
                      }),


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
                                onPressed: controller.prevSection,
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
                              onPressed: controller.nextSection,
                              child: Text(
                                "Next ▶",
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
                _indicatorDots(controller),
              ],
            ),
          ),
        ),
      );
    });
  }

  // Dots Indicator
  Widget _indicatorDots(StudentSurwayController c) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        c.surveySections.length,
            (index) => Container(
          width: 28,
          height: 6,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: c.currentSection.value == index
                ? const Color(0xFF0A61FF)
                : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  // Convert section+question index to global answer index
  int _globalIndex(int sectionIndex, int qIndex) {
    int count = 0;
    for (int i = 0; i < sectionIndex; i++) {
      count += int.parse((controller.surveySections[i]["questions"].length).toString());
    }
    return count + qIndex;
  }
}
