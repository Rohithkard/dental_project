import 'package:get/get.dart';

class StudentLoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StudentLoginController());
  }
}

class StudentLoginController extends GetxController {
  static StudentLoginController get to => Get.find();
}
