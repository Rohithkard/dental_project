import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}

class SplashController extends GetxController {
  static SplashController get to => Get.find();
}
