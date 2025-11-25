import 'package:dental_surway/model/base_model_class.dart';
import 'package:dental_surway/model/quiz_admin_model_class.dart';
import 'package:dental_surway/model/quiz_create_model.dart';
import 'package:dental_surway/utls/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class QuestinBind implements Bindings {
  @override
  void dependencies() {
    Get.put(QuestionsController());
  }
}

class QuestionsController extends GetxController {
  // UI Controllers
  RxList<QuestionModel> createdQuestions = <QuestionModel>[].obs;
  RxString selectedGroup = "".obs;
  RxString questionType = "Yes / No".obs;

  final questionText = TextEditingController();
  final answerText = TextEditingController();

  RxBool conditional = false.obs;
  RxString quizName = "".obs;

  // Create Quiz API
  BaseClassModel? baseClassModel;

  Future<void> createQuiz() async {
    if (quizName.value.isEmpty || createdQuestions.isEmpty) {
      Get.snackbar("Validation", "Quiz Name & Questions are required!");
      return;
    }

    QuizModel quiz = QuizModel(
      quizName: quizName.value,
      questions: createdQuestions,
    );

    baseClassModel = await Api.to.createQuiz(json: quiz.toJson());

    if (baseClassModel?.success ?? true) {
      createdQuestions.clear();
      quizName.value = "";
      Get.back();
      Get.snackbar("Success", "Quiz Created!");
      update();
    } else {
      Get.snackbar("Error", baseClassModel?.message ?? '');
    }
  }

  // Add Single Question Locally
  void addLocalQuestion() {
    if (questionText.text.isEmpty || answerText.text.isEmpty) {
      Get.snackbar("Empty Fields", "Please fill all fields");
      return;
    }

    createdQuestions.add(
      QuestionModel(questionText: questionText.text, answer: answerText.text),
    );

    questionText.clear();
    answerText.clear();
  }

  // Add Question to Existing Quiz
  Future<void> addMoreQuestions({required int quizId}) async {
    final payload = {
      "questions": createdQuestions.map((e) => e.toJson()).toList(),
    };

    // final response = await post("/admin/quiz/$quizId/add-question", payload);
    baseClassModel =await Api.to.createSubQuestions(json: payload, questionId: 1);
    if (baseClassModel?.success??true) {
      createdQuestions.clear();
      Get.back();
      Get.snackbar("Success", "Questions Added!");
    } else {
      Get.snackbar("Error", baseClassModel?.message??'');
    }
  }

  // Update Single Question
  Future<void> updateQuestion(String questionId) async {
    final payload = {
      "question_text": questionText.text,
      "answer": answerText.text,
    };

    baseClassModel = await Api.to.createSubQuestionsPatch(
      json: payload, questionId: 1,
    );

    if (baseClassModel?.success??false) {
      Get.back();
      Get.snackbar("Updated", "Question updated successfully");
    } else {
      Get.snackbar("Error", baseClassModel?.message??'');
    }
  }
  QuizModelClassAdmin?quizModelClassAdmin;

  void getQuiz() async{
    try{
      EasyLoading.show();
      quizModelClassAdmin=await Api.to.getQuestionsController();
      EasyLoading.dismiss();
    }catch(e){
      EasyLoading.showToast('Error$e');
    }finally{
      update();
    }
  }

}
