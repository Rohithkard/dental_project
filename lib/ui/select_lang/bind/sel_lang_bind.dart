import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLanguageBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SelectLangController());
  }

}
class SelectLangController extends GetxController {
  final selectedLanguage = Rxn<String>();

  void selectLanguage(String language) {
    selectedLanguage.value = language;
  }

  void continueToNext() {
    if (selectedLanguage.value != null) {
      Get.snackbar(
        'Selected',
        'Language: ${selectedLanguage.value}',
        snackPosition: SnackPosition.BOTTOM,
      );
      // Navigate to next page
      // Get.to(() => NextPage());
    } else {
      Get.snackbar(
        'Error',
        'Please select a language',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }
}

