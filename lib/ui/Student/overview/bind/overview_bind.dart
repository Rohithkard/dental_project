import 'package:get/get.dart';

class StudentOverViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StudentOverViewController());
  }
}


class StudentOverViewController extends GetxController {

}