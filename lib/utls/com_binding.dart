import 'package:dental_surway/utls/api_controller.dart';
import 'package:dental_surway/utls/routes.dart';
import 'package:dental_surway/utls/session_keys.dart';
import 'package:dental_surway/utls/settings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ComBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Api(), fenix: true);
    Get.put(AppSession());
  }
}

class AppSession extends GetxController {
  static AppSession get to => Get.find();

  var session = GetStorage('dental');

  Future<void> logout() async {
    session.erase();
    AppController.to.onInit();
    Get.offNamed(Routes.splash);
  }
}