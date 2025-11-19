import 'package:dental_surway/res/images.dart';
import 'package:dental_surway/utls/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // -------------------- TOP BLUE ARC --------------------
          Container(
            width: double.infinity,
            height: size.height * 0.65,
            decoration: const BoxDecoration(
              color: Color(0xff0A61FF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(400),
                bottomRight: Radius.circular(400),
              ),
            ),
            child: Center(
              child: Image.asset(
                logo, // your icon
                width: 160,
                height: 160,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 40),

          // -------------------- TITLE --------------------
          Text(
            "Dental Survey App",
            style: GoogleFonts.rubik(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 10),

          // -------------------- SUB TEXT --------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "Streamlining surveys and clinical insights for dental students.",
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.4,
              ),
            ),
          ),

          const Spacer(),

          // -------------------- BUTTON --------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0A61FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Get.toNamed('/login'); // your route
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
          ),
        ],
      ),
    );
  }
}
