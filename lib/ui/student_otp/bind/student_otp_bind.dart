import 'package:dental_surway/model/otp_verified_model.dart';
import 'package:dental_surway/utls/api_controller.dart';
import 'package:dental_surway/utls/com_binding.dart';
import 'package:dental_surway/utls/routes.dart';
import 'package:dental_surway/utls/session_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentOtpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StudentOtpController());
  }
}

class StudentOtpController extends GetxController {
  static StudentOtpController get to => Get.find();
  final otp1 = TextEditingController();
  final otp2 = TextEditingController();
  final otp3 = TextEditingController();
  final otp4 = TextEditingController();

  // Focus nodes to auto-jump between boxes
  final f1 = FocusNode();
  final f2 = FocusNode();
  final f3 = FocusNode();
  final f4 = FocusNode();

  VerifiedModelClass? verifiedModelClass;

  String getOtp() {
    return otp1.text + otp2.text + otp3.text + otp4.text;
  }


  void verifyOtp() async{
    String otp = getOtp();

    if (otp.length != 4) {
      Get.snackbar("Invalid OTP", "Please enter all digits");
      return;
    }

    verifiedModelClass=await Api.to.userVerifyLogin(otpKey: otpKey, otp: this.otp);
    if(verifiedModelClass?.success??true){
      AppSession.to.session.write(SessionKeys.STUDENT_OR_ADMIN, 'student');
      AppSession.to.session.write(SessionKeys.API_KEY, verifiedModelClass?.data?.key??'');
      Get.offAllNamed(Routes.studentNavPage);
    }else{
      Get.snackbar("Error", verifiedModelClass?.message ?? '');
    }
    // Navigate
    //
  }

  @override
  void onInit() {
    getArguments();
    super.onInit();
  }

  var otp = '';
  var otpKey = '';
  var mobNo = '';

  void getArguments() {
    var data = Get.arguments;
    if (data != null) {
      otpKey = data[0].toString();
      otp = data[1].toString();
      mobNo = data[2].toString();

      // Auto-fill OTP into fields
      if (otp.length == 4) {
        otp1.text = otp[0];
        otp2.text = otp[1];
        otp3.text = otp[2];
        otp4.text = otp[3];

        // Move focus to last field (optional)
        f4.requestFocus();
      }

      update();
    }
  }
}
