import 'package:dental_surway/ui/student_otp/bind/student_otp_bind.dart';
import 'package:dental_surway/utls/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentOtpView extends StatelessWidget {
  const StudentOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentOtpController());

    return Scaffold(
      appBar: const AppBarCustom(),
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            Text(
              "OTP Verification",
              style: GoogleFonts.rubik(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Enter the verification code we just sent on your phone number",
              style: GoogleFonts.rubik(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 32),

            // ---------------- OTP BOXES ----------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OtpBox(
                  controller: controller.otp1,
                  focusNode: controller.f1,
                  nextFocus: controller.f2,
                ),
                OtpBox(
                  controller: controller.otp2,
                  focusNode: controller.f2,
                  nextFocus: controller.f3,
                ),
                OtpBox(
                  controller: controller.otp3,
                  focusNode: controller.f3,
                  nextFocus: controller.f4,
                ),
                OtpBox(controller: controller.otp4, focusNode: controller.f4),
              ],
            ),

            const SizedBox(height: 32),

            // ------------ VERIFY BUTTON ------------
            PrimaryButton(title: "Verify", onTap: controller.verifyOtp),

            const SizedBox(height: 20),

            // ------------ RESEND ------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn’t received code?",
                  style: GoogleFonts.rubik(color: Colors.black87),
                ),
                GestureDetector(
                  onTap: () {
                    // controller.resendOtp()
                  },
                  child: Text(
                    " Resend",
                    style: GoogleFonts.rubik(
                      color: const Color(0xFF0A61FF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
