import 'package:dental_surway/ui/admin_dashboard/bind/admin_dashboard_controller.dart';
import 'package:get/get.dart';

class AdminNavBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AdminNavController());
    Get.put(AdminDashboardController());
  }
}

class AdminNavController extends GetxController {
  static AdminNavController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
