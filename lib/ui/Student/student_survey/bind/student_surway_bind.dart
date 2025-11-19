import 'package:get/get.dart';

class StudentSurwayBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StudentSurwayController());
  }
}


class StudentSurwayController extends GetxController {
  RxInt currentSection = 0.obs;

  final List<Map<String, dynamic>> surveySections = [
    {
      "title": "Oral Hygiene Practices",
      "questions": [
        {"q": "Do you brush your teeth twice daily?", "type": "yesno"},
        {"q": "Do you use dental floss regularly?", "type": "yesno"},
        {"q": "Do you use mouthwash as\npart of your routine?", "type": "yesno"},
      ]
    },
    {
      "title": "Oral Hygiene Practices",
      "questions": [
        {"q": "Any history of tobacco use?", "type": "yesno-extra"}
      ]
    },
    {
      "title": "Dental Visits",
      "questions": [
        {"q": "Have you visited a dentist in the last 6 months?", "type": "yesno"},
      ]
    },
    {
      "title": "Diet & Lifestyle",
      "questions": [
        {"q": "Do you consume sugary drinks daily?", "type": "yesno"},
      ]
    },
  ];

  RxList<Map<String, dynamic>> answers = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    _initAnswers();
    super.onInit();
  }

  void _initAnswers() {
    answers.clear();
    for (var section in surveySections) {
      for (var q in section["questions"]) {
        answers.add({"value": null});
      }
    }
  }

  void selectAnswer(int index, String value) {
    answers[index]["value"] = value;
    answers.refresh();
  }

  void nextSection() {
    if (currentSection.value < surveySections.length - 1) {
      currentSection.value++;
    }
  }

  void prevSection() {
    if (currentSection.value > 0) {
      currentSection.value--;
    }
  }
}
