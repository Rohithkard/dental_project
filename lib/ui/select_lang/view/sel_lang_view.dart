import 'package:dental_surway/ui/select_lang/bind/sel_lang_bind.dart';
import 'package:dental_surway/ui/select_lang/view/more/sel_lang_more.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLanguageView extends StatelessWidget {
   SelectLanguageView({super.key});

   final controller = Get.put(SelectLangController());



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TitleText(text: 'Select you language',),
          const SizedBox(height: 32),
          Column(
            children: [
              LanguageItem(
                languageName: 'English',
                imagePath: 'assets/images/english.jpg',
                controller: controller,
              ),
              const SizedBox(height: 8),
              LanguageItem(
                languageName: 'Español',
                imagePath: 'assets/images/spanish.jpg',
                controller: controller,
              ),
              const SizedBox(height: 8),
              LanguageItem(
                languageName: 'Français',
                imagePath: 'assets/images/french.jpg',
                controller: controller,
              ),
              const SizedBox(height: 8),
              LanguageItem(
                languageName: 'Deutsch',
                imagePath: 'assets/images/german.jpg',
                controller: controller,
              ),
              const SizedBox(height: 8),
              LanguageItem(
                languageName: '中文',
                imagePath: 'assets/images/chinese.jpg',
                controller: controller,
              ),
              const SizedBox(height: 24),
              ContinueButton(
                onPressed: (

                    ) => controller.continueToNext(),
              ),
              const SizedBox(height: 24),
            ],

          )



        ],
      ),


    );
  }
}
