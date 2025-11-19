import 'package:get/get.dart';

class AdminNavBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AdminNavController());
  }
}

class AdminNavController extends GetxController {
  static AdminNavController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
