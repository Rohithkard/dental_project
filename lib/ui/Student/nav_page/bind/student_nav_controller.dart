import 'package:get/get.dart';

class StudentNavBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StudentNavController());
  }
}


class StudentNavController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
