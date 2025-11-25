import 'package:dental_surway/ui/admin_dashboard/bind/admin_dashboard_controller.dart';
import 'package:dental_surway/ui/questions/bind/questions_controller.dart';
import 'package:get/get.dart';

class AdminNavBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AdminNavController());
    Get.put(AdminDashboardController());
    Get.put(QuestionsController());
  }
}

class AdminNavController extends GetxController {
  static AdminNavController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    if(index==0){
      AdminDashboardController.to.onInit();
    }else{
      QuestionsController.to.onInit();
    }

    currentIndex.value = index;

  }
}
