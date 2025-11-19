import 'package:dental_surway/ui/admin_dashboard/view/admin_view.dart';
import 'package:dental_surway/ui/admin_nav_dashboard/bind/admin_nav_bind.dart';
import 'package:dental_surway/ui/admin_profile/view/admin_profile_view.dart';
import 'package:dental_surway/ui/questions/view/question_view.dart';
import 'package:dental_surway/utls/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeView extends StatelessWidget {
  AdminHomeView({super.key});

  final controller = Get.put(AdminNavController());

  final pages = [AdminDashboardView(), QuestionsView(), AdminProfileView()];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),

        bottomNavigationBar: AdminBottomNav(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
        ),
      );
    });
  }
}
