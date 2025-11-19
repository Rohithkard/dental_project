import 'package:dental_surway/utls/com_binding.dart';
import 'package:dental_surway/utls/session_keys.dart';
import 'package:get/get.dart';

class Api extends GetConnect {
//------------------------------- oms -------------------------------
  static Api get to => Get.find();
  final error = false;
  final message = 'some error';
  var err = {'error': false, 'message': 'Network Or Other related issue'};

//------------------------------- oms -------------------------------
  @override
  void onInit() {
    super.onInit();
    // httpClient.baseUrl = baseUrlCommon;
    httpClient.addRequestModifier<dynamic>((request) async {
      request.headers['Authorization'] =
          AppSession.to.session.read(SessionKeys.API_KEY) ?? '';
      return request;
    });
  }
}