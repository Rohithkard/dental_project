import 'package:dental_surway/model/dashboard_summary.dart';
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
  DashboardSummary?dashboardSummary;
  @override
  void onInit() {
    getProfile();
    getDashboardSummary();
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

  void getDashboardSummary() async{
    try {
      EasyLoading.show();
      dashboardSummary = await Api.to.getDashboardOverView(no: 1);
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showToast('Error : ${e}');
    } finally {
      update();
    }
  }
}
