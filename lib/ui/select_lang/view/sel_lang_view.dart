import 'package:dental_surway/ui/select_lang/bind/sel_lang_bind.dart';
import 'package:dental_surway/ui/select_lang/view/more/sel_lang_more.dart';
import 'package:dental_surway/utls/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectLanguageView extends StatelessWidget {
  SelectLanguageView({super.key});

  final controller = Get.put(SelectLangController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              Text(
                "Select your language",
                style: GoogleFonts.rubik(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Obx(() {
                  return ListView.separated(
                    itemCount: controller.languages.length,
                    separatorBuilder: (_, __) => const Divider(height: 32),
                    itemBuilder: (_, index) {
                      final item = controller.languages[index];

                      return GestureDetector(
                        onTap: () => controller.selectLanguage(index),
                        child: Row(
                          children: [
                            // Rounded Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                item.image,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),

                            const SizedBox(width: 18),

                            Expanded(
                              child: Text(
                                item.name,
                                style: GoogleFonts.rubik(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            // Radio button
                            Obx(() {
                              bool selected =
                                  controller.selectedIndex.value == index;

                              return Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: selected
                                        ? const Color(0xFF0A61FF)
                                        : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: selected
                                    ? Center(
                                        child: Container(
                                          width: 12,
                                          height: 12,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF0A61FF),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      )
                                    : null,
                              );
                            }),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A61FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (controller.selectedIndex.value == -1) {
                      Get.snackbar("Error", "Please select a language");
                      return;
                    }
                    // Example navigation
                    Get.toNamed(Routes.studentLogin);
                  },
                  child: Text(
                    "Continue",
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
