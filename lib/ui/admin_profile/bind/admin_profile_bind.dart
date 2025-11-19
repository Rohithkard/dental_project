import 'package:get/get.dart';

class AdminProfileBind implements Bindings {
  @override
  void dependencies() {
    Get.put(AdminProfileController());
  }
}

class AdminProfileController extends GetxController {
  static AdminProfileController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
