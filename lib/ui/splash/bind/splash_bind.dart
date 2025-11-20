import 'package:dental_surway/utls/com_binding.dart';
import 'package:dental_surway/utls/routes.dart';
import 'package:dental_surway/utls/session_keys.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  @override
  void onInit() {
    var session=AppSession.to.session.read(SessionKeys.API_KEY);
    if(session!=null){
      Get.offAllNamed(Routes.studentNavPage);
    }
    super.onInit();
  }
}
