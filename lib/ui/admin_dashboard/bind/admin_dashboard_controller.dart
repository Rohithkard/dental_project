import 'package:dental_surway/model/admin_dashboard_class.dart';
import 'package:dental_surway/model/admin_profile_class.dart';
import 'package:dental_surway/model/profile_model_class.dart';
import 'package:dental_surway/utls/api_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

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
  DashboardViewModel?dashboardViewModel;

  // dummy student list
  RxList<Map<String, dynamic>> students = [
    {"name": "Jacob 21-F", "score": 24, "status": "Poor / Bad"},
  ].obs;

  @override
  void onInit() {
    getProfile();
    super.onInit();
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
}
