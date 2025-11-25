import 'package:dental_surway/ui/questions/bind/questions_controller.dart';
import 'package:dental_surway/ui/questions/view/add_question_sheet.dart';
import 'package:dental_surway/utls/common_widgets.dart';
import 'package:dental_surway/utls/utlis.dart';
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
                        SizedBox(
                          width: 5,
                        ),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.add, size: 18, color: Colors.white),
                          label:  Text("Add Question",style: TextStyle(fontSize: 14.0,color: Colors.white,fontWeight: FontWeight.bold),),
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
                      "View and organize survey \nquestion groups",
                      style: GoogleFonts.rubik(color: Colors.grey, fontSize: 16),
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

              GetBuilder<QuestionsController>(
                builder: (c) {
                  final questions = c.quizModelClassAdmin?.data?.quiz?[0]?.questions ?? [];
                  print('Object : ${questions}');
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: questions.length,
                    itemBuilder: (_, index) {
                      final q = questions[index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 18),
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                q?.questionText ?? '',
                                style: GoogleFonts.rubik(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    q?.answer ?? '',
                                    style: GoogleFonts.rubik(
                                      fontSize: 13,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.edit, color: Colors.grey[700]),
                                      onPressed: () {
                                        controller.openEditSheet(q);
                                      },
                                    ),
                                    const SizedBox(width: 14),
                                    // Icon(Icons.delete, size: 20, color: Colors.red),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              )


            ],
          ),
        ),
      ),
    );
  }
}

class EditQuestionSheet extends StatelessWidget {
  final dynamic question;
  EditQuestionSheet({required this.question});

  final controller = Get.find<QuestionsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller.questionText,
            decoration: InputDecoration(labelText: "Question"),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller.answerText,
            decoration: InputDecoration(labelText: "Answer"),
          ),
          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              controller.updateQuestion(question.id);
            },
            child: const Text("Save Changes"),
          ),
        ],
      ),
    );
  }
}
