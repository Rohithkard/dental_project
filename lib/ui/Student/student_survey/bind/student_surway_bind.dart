import 'package:dental_surway/model/base_model_class.dart';
import 'package:dental_surway/model/profile_model_class.dart';
import 'package:dental_surway/model/quiz_model.dart';
import 'package:dental_surway/model/quiz_submit_model.dart';
import 'package:dental_surway/ui/Student/student_survey/view/student_suway_view.dart';
import 'package:dental_surway/utls/api_controller.dart';
import 'package:dental_surway/utls/routes.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class StudentSurwayBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StudentSurwayController());
  }
}

class StudentSurwayController extends GetxController {
  Rx<QuizModel?> quiz = Rx<QuizModel?>(null);

  RxList<String?> answers = <String?>[].obs;
  RxInt currentIndex = 0.obs;

  Future<void> loadQuiz(int quizId) async {
    try {
      final data = await Api.to.getQuizQuestions(quizId);
      quiz.value = data;

      // initialize answers
      answers.value = List<String?>.filled(data.questions.length, null);
    } catch (e) {
      print("Error loading quiz: $e");
    }
  }

  void selectAnswer(int qIndex, String value) {
    answers[qIndex] = value;
    answers.refresh();
  }

  ProfileModelClass? profileModelClass;

  @override
  void onInit() {
    getProfile();
    loadQuiz(1);
    super.onInit();
  }

  void getProfile() async {
    try {
      EasyLoading.show();
      profileModelClass = await Api.to.getProfile();
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showToast('Error : $e');
    } finally {
      update();
    }
  }

  void nextQuestion() {
    if (currentIndex.value < (quiz.value!.questions.length - 1)) {
      currentIndex.value++;
    }
  }

  void prevQuestion() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }

  BaseClassModel? baseClassModel;
  QuizSubmitData?quizSubmitData;
  Future<void> submitFinalQuiz() async {
    if (quiz.value == null) return;

    final q = quiz.value!;
    final List<Map<String, dynamic>> answerPayload = [];

    for (int i = 0; i < q.questions.length; i++) {
      answerPayload.add({
        "question_id": q.questions[i].id,
        "answer": answers[i] ?? "",
      });
    }

    try {
      quizSubmitData = await Api.to.submitQuiz(
        quizId: q.id,
        studentId: int.parse(profileModelClass?.data?.id??'0'),
        answers: answerPayload,
      );
      if (quizSubmitData?.success ?? true) {
        // showQuizResultPopup(quizSubmitData?.data);
        Get.offAllNamed(Routes.studentNavPage);
      } else {
        Get.snackbar("Error", baseClassModel?.message ?? '');
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to submit quiz");
    }
  }
}
