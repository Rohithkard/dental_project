import 'package:dental_surway/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLanguageBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SelectLangController());
  }

}
class SelectLangController extends GetxController {
  RxInt selectedIndex = (-1).obs;

  final RxList<LanguageModel> languages = <LanguageModel>[
    LanguageModel(name: "English", image: "assets/images/english.png"),
    LanguageModel(name: "Español", image: "assets/images/spanish.png"),
    LanguageModel(name: "Français", image: "assets/images/french.png"),
    LanguageModel(name: "Deutsch", image: "assets/images/german.png"),
    LanguageModel(name: "中文", image: "assets/images/chinese.png"),
  ].obs;

  void selectLanguage(int index) {
    selectedIndex.value = index;
  }

}

