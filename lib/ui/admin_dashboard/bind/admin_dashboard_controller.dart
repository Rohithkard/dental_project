import 'package:dental_surway/model/admin_dashboard_class.dart';
import 'package:dental_surway/model/admin_profile_class.dart';
import 'package:dental_surway/model/excel_downlod.dart';
import 'package:dental_surway/model/profile_model_class.dart';
import 'package:dental_surway/model/quizz_model_class.dart';
import 'package:dental_surway/utls/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminDashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AdminDashboardController());
  }
}

class AdminDashboardController extends GetxController {
  static AdminDashboardController get to => Get.find();
  RxInt totalStudents = 24.obs;
  RxInt averageScore = 24.obs;
  RxInt topScore = 100.obs;

  RxString searchQuery = "".obs;
  ProfileAdminModelClass? profileModelClass;
  DashboardViewModel? dashboardViewModel;

  // dummy student list
  RxList<Map<String, dynamic>> students = [
    {"name": "Jacob 21-F", "score": 24, "status": "Poor / Bad"},
  ].obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    getProfile();
    getAttemptQuiz();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          hasMore.value &&
          !isLoadingMore.value) {
        loadMore();
      }
    });
    super.onInit();
  }

  void loadMore() async {
    if (!hasMore.value) return;

    isLoadingMore.value = true;

    getAttemptQuiz(isInitial: false);

    isLoadingMore.value = false;
  }

  void getProfile() async {
    try {
      EasyLoading.show();
      profileModelClass = await Api.to.getAdminProfile();
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showToast('Error : $e');
    } finally {
      update();
    }
  }

  void getDashboardDetails() async {
    EasyLoading.show();
    dashboardViewModel = await Api.to.getDashboardView();
    EasyLoading.dismiss();
    if (dashboardViewModel?.success ?? true) {
    } else {
      Get.snackbar("Error", dashboardViewModel?.message ?? '');
    }
    update();
  }

  QuizAdminModelClass? quizAdminModelClass;

  RxList<Attempts> attempts = <Attempts>[].obs;
  TextEditingController searchField = TextEditingController();

  var pageNo = 1;
  var isLoadingMore = false.obs;
  var hasMore = true.obs;

  void getAttemptQuiz({bool isInitial = true}) async {
    try {
      if (isInitial) {
        pageNo = 1;
        attempts.clear();
        hasMore.value = true;
      }

      EasyLoading.show();

      quizAdminModelClass = await Api.to.getQuizAttempt(
        page: pageNo,
        search: searchField.text,
      );

      final newAttempts = quizAdminModelClass?.data?.attempts ?? [];

      if (newAttempts.isEmpty) {
        hasMore.value = false;
      } else {
        attempts.addAll(newAttempts);
        pageNo++;
      }

      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showToast('Error: $e');
    } finally {
      update();
    }
  }

  RxBool isDownloading = false.obs;
  ExcelDownloadModel? excelDownloadModel;

  Future<void> downloadExcel({String search = ""}) async {
    try {
      isDownloading.value = true;
      EasyLoading.show(status: "Generating Excel...");

      excelDownloadModel = await Api.to.getExcelDownload(
        search: searchField.text,
      );

      EasyLoading.dismiss();

      if (excelDownloadModel?.success ?? false) {
        Get.snackbar(
          "Success",
          "Excel ready for download!",
          snackPosition: SnackPosition.BOTTOM,
        );

        // OPTIONAL: Auto open the Excel download link
        await launchUrl(Uri.parse(excelDownloadModel?.url ?? ''));
      } else {
        Get.snackbar("Error", excelDownloadModel?.message ?? "Failed");
      }
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", e.toString());
    } finally {
      isDownloading.value = false;
    }
  }
}
