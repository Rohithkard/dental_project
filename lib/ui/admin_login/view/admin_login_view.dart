import 'package:dental_surway/res/images.dart';
import 'package:dental_surway/ui/admin_login/bind/admin_login_bind.dart';
import 'package:dental_surway/utls/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminLoginView extends StatelessWidget {
   AdminLoginView({super.key});
   final controller = Get.put(AdminLoginController());

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: const AppBarCustom(),
       backgroundColor: Colors.white,

       body: GetBuilder<AdminLoginController>(
         builder: (logic) {
           return SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 24),
               child: Column(
                 children: [
                   const SizedBox(height: 20),

                   // -------- LOGO ----------
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

                   const SizedBox(height: 32),

                   Align(
                     alignment: Alignment.centerLeft,
                     child: Text(
                       "Admin Login",
                       style: GoogleFonts.rubik(
                         fontSize: 20,
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                   ),

                   const SizedBox(height: 4),

                   Align(
                     alignment: Alignment.centerLeft,
                     child: Text(
                       "Access admin dashboard to view student results",
                       style: GoogleFonts.rubik(
                         fontSize: 14,
                         color: Colors.grey,
                       ),
                     ),
                   ),

                   const SizedBox(height: 24),

                   // ------------- EMAIL FIELD -------------
                   AppInputField(
                     label: "Email",
                     //controller: controller.email,
                     controller: logic.email,
                     keyboard: TextInputType.emailAddress,
                   ),

                   const SizedBox(height: 20),

                   // ------------- PASSWORD FIELD -------------
                   Obx(() {
                     return TextField(
                      // controller: controller.password,
                       controller: logic.password,
                       obscureText: controller.obscure.value,
                       decoration: InputDecoration(
                         labelText: "Password",
                         labelStyle: GoogleFonts.rubik(
                           color: Colors.black87,
                           fontSize: 14,
                           fontWeight: FontWeight.w500,
                         ),
                         hintText: "Enter your password",
                         hintStyle: GoogleFonts.rubik(color: Colors.grey),
                         filled: true,
                         fillColor: const Color(0xFFF7F8F9),
                         contentPadding: const EdgeInsets.symmetric(
                             horizontal: 14, vertical: 14),
                         suffixIcon: IconButton(
                           icon: Icon(
                             controller.obscure.value
                                 ? Icons.visibility_off
                                 : Icons.visibility,
                             color: Colors.grey,
                           ),
                           onPressed: controller.togglePassword,
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8),
                           borderSide:
                           const BorderSide(color: Color(0xFFE8ECF4)),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8),
                           borderSide: const BorderSide(
                               color: Color(0xFF0A61FF), width: 1.4),
                         ),
                       ),
                     );
                   }),

                   const SizedBox(height: 32),

                   // ------------ LOGIN BUTTON ------------
                   PrimaryButton(
                     title: "Login as Admin",
                     onTap: () {
                       logic.loginAdmin();
                     }
                     //controller.login,
                   ),

                   const SizedBox(height: 40),

                   // ------------ DEMO CREDS ------------
                   // Text(
                   //   "Demo: admin@dental.edu / admin123",
                   //   style: GoogleFonts.rubik(
                   //     fontSize: 13,
                   //     color: Colors.grey,
                   //   ),
                   // ),

                   const SizedBox(height: 20),
                 ],
               ),
             ),
           );
         }
       ),
     );
   }
}

 


