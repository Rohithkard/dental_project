import 'package:dental_surway/model/sign_up_model_class.dart';
import 'package:dental_surway/utls/api_controller.dart';
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

  SignUpModelClass? signUpModelClass;

  void submitRegistration() async {
    if (gender.text.isEmpty || phone.text.isEmpty || address.text.isEmpty) {
      Get.snackbar("Missing Information", "Please fill all fields");
      return;
    }

    signUpModelClass = await Api.to.signupStudent(
      mob: phone.text,
      email: 'null',
      age: age.text,
      gender: gender.text,
      full_name: fullName.text,
      address: address.text,
    );

    if(signUpModelClass?.success??true){

    }else{
      Get.snackbar("Success", "Registration Completed!");

    }

  }
}
