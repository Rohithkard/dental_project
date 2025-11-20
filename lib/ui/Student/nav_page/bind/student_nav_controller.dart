import 'package:dental_surway/ui/Student/overview/bind/overview_bind.dart';
import 'package:get/get.dart';

class StudentNavBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StudentNavController());
    Get.put(StudentOverViewController());

  }
}


class StudentNavController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
