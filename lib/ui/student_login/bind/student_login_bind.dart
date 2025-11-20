import 'package:dental_surway/model/sign_up_model_class.dart';
import 'package:dental_surway/utls/api_controller.dart';
import 'package:dental_surway/utls/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class StudentLoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StudentLoginController());
  }
}

class StudentLoginController extends GetxController {
  static StudentLoginController get to => Get.find();

  TextEditingController username = TextEditingController();

  SignUpModelClass? signUpModelClass;

  void checkValidUser() async {
    try {
      if ((username?.text ?? '').isEmpty) {
        return;
      }
      EasyLoading.show();
      signUpModelClass = await Api.to.userStudentLogin(phone: username.text);
      EasyLoading.dismiss();
      if (!(signUpModelClass?.success ?? false)) {
        Get.snackbar("Error", signUpModelClass?.message ?? '');
      }else{
        Get.toNamed(
          Routes.studentOtp,
          arguments: [
            signUpModelClass?.data?.otpKey ?? '',
            signUpModelClass?.data?.otp ?? '',
            username.text
          ],
        );
      }
    } catch (ex) {
      EasyLoading.showToast('Error : $ex');
    }
  }
}
