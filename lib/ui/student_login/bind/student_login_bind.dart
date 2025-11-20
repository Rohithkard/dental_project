import 'package:dental_surway/model/sign_up_model_class.dart';
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

  TextEditingController username=TextEditingController();


  SignUpModelClass? signUpModelClass;

  void checkValidUser(){
    try{
    EasyLoading.show();

    EasyLoading.dismiss();
    }catch(ex){
      EasyLoading.showToast('Error : $ex');
    }
  }


}
