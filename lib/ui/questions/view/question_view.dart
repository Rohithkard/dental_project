import 'package:dental_surway/ui/questions/bind/questions_controller.dart';
import 'package:dental_surway/ui/questions/view/add_question_sheet.dart';
import 'package:dental_surway/utls/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsView extends StatelessWidget {
  QuestionsView({super.key});

  final controller = Get.put(QuestionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F0FF),

      bottomNavigationBar: AdminBottomNav(
        currentIndex: 1,
        onTap: (i) {},
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Header
              Text(
                "Admin Dashboard",
                style: GoogleFonts.rubik(
                    fontSize: 22, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Text(
                "Manage and view student surveys",
                style: GoogleFonts.rubik(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              // Manage Survey Questions card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Manage Survey Questions",
                            style: GoogleFonts.rubik(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.add, size: 18, color: Colors.white),
                          label: const Text("Add Question"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0A61FF),
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {
                            Get.bottomSheet(AddQuestionSheet(), isScrollControlled: true);
                          },
                        )
                      ],
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "View and organize survey question groups",
                      style: GoogleFonts.rubik(color: Colors.grey),
                    ),

                    const SizedBox(height: 14),

                    // Search
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search for students",
                        filled: true,
                        fillColor: const Color(0xFFF7F8F9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                          const BorderSide(color: Color(0xFFE8ECF4)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Groups + questions list
              Obx(() {
                return Column(
                  children: controller.groups.map((group) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 18),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Group header
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  group["title"],
                                  style: GoogleFonts.rubik(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black,
                                ),
                                child: Text(
                                  "${group["questionsCount"]} questions",
                                  style: GoogleFonts.rubik(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              )
                            ],
                          ),

                          const SizedBox(height: 18),

                          // Questions
                          ...group["questions"].map<Widget>((q) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: const Color(0xFFE4E8F0),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        q["text"],
                                        style: GoogleFonts.rubik(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),

                                    // Actions
                                    Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius: BorderRadius.circular(8)),
                                          child: Text(
                                            q["type"],
                                            style: GoogleFonts.rubik(
                                                fontSize: 13, color: Colors.black87),
                                          ),
                                        ),

                                        const SizedBox(height: 10),

                                        Row(
                                          children: [
                                            Icon(Icons.edit, size: 20, color: Colors.grey[700]),
                                            const SizedBox(width: 14),
                                            Icon(Icons.delete, size: 20, color: Colors.red),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    );
                  }).toList(),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}