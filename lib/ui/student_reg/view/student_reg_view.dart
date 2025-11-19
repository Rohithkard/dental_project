import 'package:dental_surway/res/images.dart';
import 'package:dental_surway/ui/admin_login/bind/admin_login_bind.dart';
import 'package:dental_surway/ui/student_reg/bind/student_reg_bind.dart';
import 'package:dental_surway/utls/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class StudentRegView extends StatelessWidget {
   StudentRegView({super.key});
  final controller = Get.put(StudentRegController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // ------------ Logo ------------
              CircleAvatar(
                radius: 32,
                backgroundColor: const Color(0xFF0A61FF),
                child: Image.asset(
                  logo,
                  height: 38,
                  width: 38,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "Dental Survey App",
                style: GoogleFonts.rubik(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "Complete surveys and track progress",
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),

              const SizedBox(height: 30),

              // -------------------- Reactive Step UI --------------------
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Registration",
                      style: GoogleFonts.rubik(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      controller.step.value == 1
                          ? "Create an account"
                          : "Create a new account",
                      style: GoogleFonts.rubik(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 24),

                    if (controller.step.value == 1)
                      buildStepOneUI()
                    else
                      buildStepTwoUI(),

                    const SizedBox(height: 20),

                    PrimaryButton(
                      title: "Next",
                      onTap: controller.nextStep,
                    ),

                    const SizedBox(height: 20),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // -------------------- STEP 1 UI --------------------
  Widget buildStepOneUI() {
    return Column(
      children: [
        AppInputField(
          label: "Full Name",
          controller: controller.fullName,
        ),

        const SizedBox(height: 20),

        AppInputField(
          label: "Age",
          controller: controller.age,
          keyboard: TextInputType.number,
        ),
      ],
    );
  }

  // -------------------- STEP 2 UI --------------------
  Widget buildStepTwoUI() {
    return Column(
      children: [
        AppInputField(
          label: "Gender",
          controller: controller.gender,
        ),

        const SizedBox(height: 20),

        AppInputField(
          label: "Phone number",
          controller: controller.phone,
          keyboard: TextInputType.phone,
        ),

        const SizedBox(height: 20),

        AppInputField(
          label: "Address",
          controller: controller.address,
        ),
      ],
    );
  }
}
