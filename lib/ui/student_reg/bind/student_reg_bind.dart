import 'package:get/get.dart';
import 'package:flutter/material.dart';
class StudentRegBind implements Bindings {
  @override
  void dependencies() {
    Get.put(StudentRegController());
  }
}

class StudentRegController extends GetxController {
  static StudentRegController get to => Get.find();
  // Step tracker
  RxInt step = 1.obs;

  // Step 1 fields
  final fullName = TextEditingController();
  final age = TextEditingController();

  // Step 2 fields
  final gender = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();

  void nextStep() {
    if (step.value == 1) {
      if (fullName.text.isEmpty || age.text.isEmpty) {
        Get.snackbar("Missing Information", "Please fill all fields");
        return;
      }
      step.value = 2;
    } else {
      submitRegistration();
    }
  }

  void submitRegistration() {
    if (gender.text.isEmpty ||
        phone.text.isEmpty ||
        address.text.isEmpty) {
      Get.snackbar("Missing Information", "Please fill all fields");
      return;
    }

    // Submit or call API
    // Get.offAllNamed('/dashboard');

    Get.snackbar("Success", "Registration Completed!");
  }
}
