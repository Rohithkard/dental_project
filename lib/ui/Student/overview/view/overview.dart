import 'package:dental_surway/ui/Student/overview/bind/overview_bind.dart';
import 'package:dental_surway/ui/student_login/view/student_login_view.dart';
import 'package:dental_surway/utls/com_binding.dart';
import 'package:dental_surway/utls/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OverviewView extends StatelessWidget {
  const OverviewView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F0FF),
      body:  SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: GetBuilder<StudentOverViewController>(
                  builder: (logic) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // ---------------- HEADER ----------------
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome ${logic.profileModelClass?.data?.name??''}!",
                                  style: GoogleFonts.rubik(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF0A61FF),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  "ID: ${logic.profileModelClass?.data?.id??''}",
                                  style: GoogleFonts.rubik(
                                    fontSize: 14,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              Get.defaultDialog(
                                title: "Logout",
                                middleText: "Are you sure you want to logout?",
                                titleStyle: GoogleFonts.rubik(fontWeight: FontWeight.w600),
                                middleTextStyle: GoogleFonts.rubik(),

                                // Buttons
                                textCancel: "Cancel",
                                textConfirm: "Logout",
                                confirmTextColor: Colors.white,
                                buttonColor: Colors.red,
                                cancelTextColor: Colors.blueGrey,

                                onConfirm: () {
                                  AppSession.to.logout();
                                  Get.back(); // close dialog
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.exit_to_app,
                                      size: 20, color: Colors.blue.shade700),
                                  const SizedBox(width: 6),
                                  Text(
                                    "Logout",
                                    style: GoogleFonts.rubik(
                                        color: Colors.blue.shade700,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // ---------------- SURVEY COMPLETE CARD ----------------
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.check_circle,
                                color: Colors.green.shade600, size: 60),
                            const SizedBox(height: 16),

                            Text(
                              "Survey Complete!",
                              style: GoogleFonts.rubik(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              "Thank you for completing the dental survey",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.rubik(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),

                            const SizedBox(height: 28),

                            // ---------------- TOTAL SCORE BOX ----------------
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.green.shade300),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Total Score",
                                    style: GoogleFonts.rubik(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green.shade700,
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  Text(
                                    "0",
                                    style: GoogleFonts.rubik(
                                      fontSize: 42,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green.shade800,
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade100,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "Good",
                                      style: GoogleFonts.rubik(
                                          color: Colors.green.shade700,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),

                                  const SizedBox(height: 12),

                                  Text(
                                    "Clinical assessment annually",
                                    style: GoogleFonts.rubik(
                                      fontSize: 14,
                                      color: Colors.green.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // ---------------- RETAKE BUTTON ----------------
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0A61FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.studentSurwayLine);
                          },
                          child: Text(
                            "Retake Survey",
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // ---------------- LEGEND BOX ----------------
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            scoreLegend("Good (0-5)", Colors.green.shade300),
                            const SizedBox(height: 10),
                            scoreLegend("Satisfactory (6-10)", Colors.amber.shade400),
                            const SizedBox(height: 10),
                            scoreLegend("Poor / Bad (>10)", Colors.red.shade300),
                            const SizedBox(height: 20),

                            // Assessment suggestions
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Annual assessment",
                                    style: GoogleFonts.rubik(fontSize: 16)),
                                Text("6-month assessment",
                                    style: GoogleFonts.rubik(fontSize: 16)),
                              ],
                            ),

                            const SizedBox(height: 12),

                            Text(
                              "Immediate consultation",
                              style: GoogleFonts.rubik(fontSize: 16),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 80),
                    ],
                  );
                }
              ),
            )
      )
    );
  }

  // ---------- Legend UI ----------
  Widget scoreLegend(String text, Color color) {
    return Row(
      children: [
        Container(
          padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            text,
            style: GoogleFonts.rubik(
                fontSize: 14, color: Colors.black87),
          ),
        )
      ],
    );
  }
}
