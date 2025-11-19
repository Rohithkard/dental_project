import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestinBind implements Bindings {
  @override
  void dependencies() {
    Get.put(QuestionsController());
  }
}


class QuestionsController extends GetxController {
  // Search
  RxString search = "".obs;

  // Fake groups with questions
  RxList<Map<String, dynamic>> groups = [
    {
      "title": "Oral Hygiene Practices",
      "questionsCount": 3,
      "questions": [
        {
          "text": "Do you brush your teeth twice daily?",
          "type": "yes/no",
        },
        {
          "text": "Do you use dental floss regularly?",
          "type": "yes/no",
        },
      ]
    },
  ].obs;

  // Modal form controllers
  final questionText = TextEditingController();
  RxString selectedGroup = "".obs;
  RxString questionType = "Number Input".obs;

  RxBool conditional = false.obs;

  List<String> questionTypes = [
    "Number Input",
    "Text Input",
    "Yes / No",
    "Multiple Choice",
    "Rating",
  ];
}