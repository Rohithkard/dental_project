import 'package:dental_surway/model/admin_dashboard_class.dart';
import 'package:dental_surway/model/admin_login_model_class.dart';
import 'package:dental_surway/utls/api_controller.dart';
import 'package:dental_surway/utls/com_binding.dart';
import 'package:dental_surway/utls/routes.dart';
import 'package:dental_surway/utls/session_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

  AdminLoginModel?adminLoginModel;
  DashboardViewModel?dashboardViewModel;

  void togglePassword() {
    obscure.value = !obscure.value;
  }


  void loginAdmin() async {
    EasyLoading.show();
    adminLoginModel = await Api.to.adminLogin(
        username: email.text,
        password: password.text,

    );
    EasyLoading.dismiss();
    if (adminLoginModel?.success ?? true) {
      AppSession.to.session.write(SessionKeys.API_KEY, adminLoginModel?.data?.apiKey??'');
      AppSession.to.session.write(SessionKeys.STUDENT_OR_ADMIN, 'admin');

      Get.offAllNamed(Routes.mainAdminRoute);
    } else {
      Get.snackbar("Error", adminLoginModel?.message ?? '');
    }
  }



}
