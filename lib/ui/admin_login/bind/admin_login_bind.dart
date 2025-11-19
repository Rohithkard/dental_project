import 'package:dental_surway/utls/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLoginBind implements Bindings {
  @override
  void dependencies() {
    Get.put(AdminLoginController());
  }
}

class AdminLoginController extends GetxController {
  static AdminLoginController get to => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();

  RxBool obscure = true.obs;

  void togglePassword() {
    obscure.value = !obscure.value;
  }

  void login() {
    if (email.text.isEmpty || password.text.isEmpty) {
      Get.snackbar("Missing Fields", "Please fill email and password");
      return;
    }

    // TODO: Call API
    Get.offAllNamed(Routes.mainAdminRoute);
  }

}
