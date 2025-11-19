import 'package:dental_surway/ui/Student/nav_page/bind/student_nav_controller.dart';
import 'package:dental_surway/ui/Student/overview/view/overview.dart';
import 'package:dental_surway/utls/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentHomeView extends StatelessWidget {
  StudentHomeView({super.key});

  final controller = Get.put(StudentNavController());

  final pages = [OverviewView(),];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),

        bottomNavigationBar: StudentBottomNav(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
        ),
      );
    });
  }
}
