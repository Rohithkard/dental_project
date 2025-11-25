import 'package:dental_surway/model/admin_dashboard_class.dart';
import 'package:dental_surway/model/admin_login_model_class.dart';
import 'package:dental_surway/model/admin_profile_class.dart';
import 'package:dental_surway/model/base_model_class.dart';
import 'package:dental_surway/model/dashboard_summary.dart';
import 'package:dental_surway/model/otp_verified_model.dart';
import 'package:dental_surway/model/profile_model_class.dart';
import 'package:dental_surway/model/quiz_admin_model_class.dart';
import 'package:dental_surway/model/quiz_model.dart';
import 'package:dental_surway/model/quiz_submit_model.dart';
import 'package:dental_surway/model/sign_up_model_class.dart';
import 'package:dental_surway/utls/com_binding.dart';
import 'package:dental_surway/utls/const.dart';
import 'package:dental_surway/utls/session_keys.dart';
import 'package:get/get.dart';

class Api extends GetConnect {
  //------------------------------- oms -------------------------------
  static Api get to => Get.find();
  final error = false;
  final message = 'some error';
  var err = {'error': false, 'message': 'Network Or Other related issue'};

  //------------------------------- oms -------------------------------
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = baseUrlCommon;
    httpClient.addRequestModifier<dynamic>((request) async {
      request.headers['Authorization'] =
          AppSession.to.session.read(SessionKeys.API_KEY) ?? '';
      return request;
    });
  }

  Future<SignUpModelClass> signupStudent({
    required var mob,
    required var full_name,
    required var email,
    required var age,
    required var gender,
    required var address,
    required var code,
  }) {
    return post(
      '/user/sign_up',
      FormData({
        'mob': mob,
        'full_name': full_name,
        'email': email,
        'age': age,
        'gender': gender,
        'address': address,
        'code': code,
      }),
    ).then((value) {
      return SignUpModelClass.fromJson(value.body ?? err);
    });
  }

  Future<SignUpModelClass> userStudentLogin({required var phone}) {
    return post('/user/login', FormData({'phone': phone})).then((value) {
      return SignUpModelClass.fromJson(value.body ?? err);
    });
  }

  Future<VerifiedModelClass> userVerifyLogin({
    required var otpKey,
    required var otp,
  }) {
    return post(
      '/user/verify_otp',
      FormData({'otpKey': otpKey, 'otp': otp}),
    ).then((value) {
      return VerifiedModelClass.fromJson(value.body ?? err);
    });
  }

  Future<AdminLoginModel> adminLogin({
    required var username,
    required var password,
  }) {
    return post(
      '/admin/login',
      FormData({'username': username, 'password': password}),
    ).then((value) {
      print('username : $username password : $password body: ${value.body}');
      return AdminLoginModel.fromJson(value.body ?? err);
    });
  }

  Future<ProfileModelClass> getProfile() {
    return get('/user/profile').then((value) {
      return ProfileModelClass.fromJson(value.body ?? err);
    });
  }

  Future<ProfileAdminModelClass> getAdminProfile() {
    return get('/admin/profile').then((value) {
      return ProfileAdminModelClass.fromJson(value.body ?? err);
    });
  }

  Future<DashboardViewModel> getDashboardView() {
    return get('/admin/dashboard/view').then((value) {
      return DashboardViewModel.fromJson(value.body ?? err);
    });
  }

  Future<DashboardSummary> getDashboardOverView({required var no}) {
    return get('/user/dashboard/summary/$no').then((value) {
      return DashboardSummary.fromJson(value.body ?? err);
    });
  }

  Future<QuizModel> getQuizQuestions(int quizId) {
    return get("/user/quiz/$quizId/questions").then((value) {
      return QuizModel.fromJson(value.body ?? err);
    });
  }

  Future<QuizModelClassAdmin> getQuestionsController() {
    return get("/admin/quiz/list/1").then((value) {
      return QuizModelClassAdmin.fromJson(value.body ?? err);
    });
  }

  Future<QuizSubmitData> submitQuiz({
    required int quizId,
    required int studentId,
    required List<Map<String, dynamic>> answers,
  }) {
    return post("/user/quiz/$quizId/submit", {
      "student_id": studentId,
      "answers": answers,
    }).then((value) {
      return QuizSubmitData.fromJson(value.body["data"]);
    });
  }

  Future<BaseClassModel> createQuiz({required Map<String, dynamic> json}) {
    return post('/admin/quiz/create', json)
        .then((value) {
          return BaseClassModel.fromJson(value.body);
        })
        .catchError((err) {
          return BaseClassModel.fromJson({
            "success": false,
            "message": err.toString(),
          });
        });
  }

  Future<BaseClassModel> createSubQuestions({
    required Map<String, dynamic> json,
    required var questionId,
  }) {
    return post('/admin/quiz/$questionId/add-question', json)
        .then((value) {
          return BaseClassModel.fromJson(value.body);
        })
        .catchError((err) {
          return BaseClassModel.fromJson({
            "success": false,
            "message": err.toString(),
          });
        });
  }

  Future<BaseClassModel> createSubQuestionsPatch({
    required Map<String, dynamic> json,
    required var questionId,
  }) {
    return patch('/admin/quiz/$questionId/add-question', json)
        .then((value) {
          return BaseClassModel.fromJson(value.body);
        })
        .catchError((err) {
          return BaseClassModel.fromJson({
            "success": false,
            "message": err.toString(),
          });
        });
  }
}
