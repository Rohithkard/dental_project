import 'package:get/get.dart';

class AdminLoginBind implements Bindings {
  @override
  void dependencies() {
    Get.put(AdminLoginController());
  }
}

class AdminLoginController extends GetxController {
  static AdminLoginController get to => Get.find();
}
