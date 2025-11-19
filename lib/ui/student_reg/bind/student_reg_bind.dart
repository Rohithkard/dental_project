import 'package:get/get.dart';

class StudentRegBind implements Bindings {
  @override
  void dependencies() {
    Get.put(StudentRegController());
  }
}

class StudentRegController extends GetxController {
  static StudentRegController get to => Get.find();
}
