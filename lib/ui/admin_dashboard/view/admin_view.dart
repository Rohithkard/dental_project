import 'package:dental_surway/ui/admin_dashboard/bind/admin_dashboard_controller.dart';
import 'package:dental_surway/ui/admin_login/view/admin_login_view.dart';
import 'package:dental_surway/utls/com_binding.dart';
import 'package:dental_surway/utls/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminDashboardView extends StatelessWidget {
  AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F0FF), // Light blue bg

      body: SafeArea(
        child: SingleChildScrollView(
          controller: AdminDashboardController.to.scrollController,
          padding: const EdgeInsets.all(16),
          child: GetBuilder<AdminDashboardController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Admin Dashboard",
                          style: GoogleFonts.rubik(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          AppSession.to.logout();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.exit_to_app,
                                size: 20,
                                color: Colors.blue.shade700,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "Logout",
                                style: GoogleFonts.rubik(
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "Manage and view student surveys",
                    style: GoogleFonts.rubik(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Metrics
                  MetricCard(
                    title: "Total Students",
                    value: controller.totalStudents.value.toString(),
                    icon: const Icon(Icons.people, color: Colors.blue),
                    iconBg: const Color(0xFFDDEBFF),
                  ),

                  const SizedBox(height: 16),

                  MetricCard(
                    title: "Average Score",
                    value: "${controller.averageScore.value}%",
                    icon: const Icon(Icons.trending_up, color: Colors.green),
                    iconBg: const Color(0xFFDFF7E1),
                  ),

                  const SizedBox(height: 16),

                  MetricCard(
                    title: "Top Score",
                    value: "${controller.topScore.value}%",
                    icon: const Icon(Icons.emoji_events, color: Colors.orange),
                    iconBg: const Color(0xFFFFECD7),
                  ),

                  const SizedBox(height: 20),

                  // Search Students
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Search Students",
                                style: GoogleFonts.rubik(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                controller.downloadExcel();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0A61FF),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.upload,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      "Export CSV",
                                      style: GoogleFonts.rubik(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: "Search for students",
                            filled: true,
                            fillColor: const Color(0xFFF7F8F9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFFE8ECF4),
                              ),
                            ),
                          ),
                          controller: controller.searchField,
                          onChanged: (v){
                            controller.getAttemptQuiz();
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Student Scores List
                  Text(
                    "Student Scores",
                    style: GoogleFonts.rubik(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    "Showing 1 of ${controller.dashboardViewModel?.data?.totalStudents ?? 0} students",
                    style: GoogleFonts.rubik(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      ...controller.attempts.map((a) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: StudentScoreTile(
                            name: a.student?.name ?? '',
                           summary: a?.summary,
                          ),
                        );
                      }).toList(),

                      // Loader for pagination
                      if (controller.isLoadingMore.value)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: CircularProgressIndicator(),
                          ),
                        ),

                      // No more data
                      if (!controller.hasMore.value)
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "No more records",
                            style: GoogleFonts.rubik(color: Colors.grey),
                          ),
                        ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
