import 'package:dental_surway/res/images.dart';
import 'package:dental_surway/ui/student_login/bind/student_login_bind.dart';
import 'package:dental_surway/utls/common_widgets.dart';
import 'package:dental_surway/utls/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentLoginView extends StatelessWidget {
  StudentLoginView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      backgroundColor: Colors.white,
      body: GetBuilder<StudentLoginController>(
        builder: (logic) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const SizedBox(height: 20),

                  // ------------ Logo ------------
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: const Color(0xFF0A61FF),
                    child: Image.asset(
                      logo,
                      width: 38,
                      height: 38,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ------------ Title ------------
                  Text(
                    "Dental Survey App",
                    style: GoogleFonts.rubik(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Complete surveys and track progress",
                    style: GoogleFonts.rubik(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // ------------ Login Title ------------
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Login",
                      style: GoogleFonts.rubik(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enter your credentials to access surveys",
                      style: GoogleFonts.rubik(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ------------ Mobile Field ------------
                  AppInputField(
                    label: "Mobile number",
                    controller: logic.username,
                    keyboard: TextInputType.phone,
                  ),

                  const SizedBox(height: 20),

                  // ------------ Request OTP ------------
                  PrimaryButton(
                    title: "Request OTP for Login",
                    onTap: () {
                      logic.checkValidUser();
                     // Get.toNamed(Routes.studentOtp);
                    },
                  ),

                  const SizedBox(height: 14),

                  // ------------ Register ------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: GoogleFonts.rubik(fontSize: 14),
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.studentRegRoute);
                        },
                        child: Text(
                          "Register Now",
                          style: GoogleFonts.rubik(
                            color: Color(0xFF0A61FF),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        }
      ),

      // -------------- Admin Button --------------
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFE8F1FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.adminLoginRoute);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                adminLogo,
                width: 18,
                height: 18,
              ),
              const SizedBox(width: 8),
              Text(
                "Log In as Admin",
                style: GoogleFonts.rubik(
                  color: const Color(0xFF0A61FF),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
