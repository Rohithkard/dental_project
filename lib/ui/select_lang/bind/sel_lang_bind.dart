import 'package:get/get.dart';

class SelectLanguageBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SelectLangController());
  }

}
class SelectLangController extends GetxController{

}