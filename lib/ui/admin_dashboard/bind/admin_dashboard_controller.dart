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

  // dummy student list
  RxList<Map<String, dynamic>> students = [
    {
      "name": "Jacob 21-F",
      "score": 24,
      "status": "Poor / Bad"
    },
  ].obs;
}
