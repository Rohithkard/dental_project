import 'package:get/get.dart';

class StudentProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StudentProfileController());
  }
}


class StudentProfileController extends GetxController {

}