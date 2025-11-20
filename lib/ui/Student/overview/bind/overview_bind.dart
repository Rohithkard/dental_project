import 'package:dental_surway/model/profile_model_class.dart';
import 'package:dental_surway/utls/api_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class StudentOverViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StudentOverViewController());
  }
}

class StudentOverViewController extends GetxController {
  ProfileModelClass? profileModelClass;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  void getProfile() async {
    try {
      EasyLoading.show();
      profileModelClass = await Api.to.getProfile();
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showToast('Error : ${e}');
    } finally {
      update();
    }
  }
}
