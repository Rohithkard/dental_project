import 'package:get/get.dart';

class StudentOtpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StudentOtpController());
  }
}

class StudentOtpController extends GetxController {
  static StudentOtpController get to => Get.find();
}
