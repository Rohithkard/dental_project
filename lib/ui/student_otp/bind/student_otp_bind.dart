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

  String getOtp() {
    return otp1.text + otp2.text + otp3.text + otp4.text;
  }

  void verifyOtp() {
    String otp = getOtp();

    if (otp.length != 4) {
      Get.snackbar("Invalid OTP", "Please enter all digits");
      return;
    }

    // Navigate
    // Get.toNamed('/dashboard');
  }
}
