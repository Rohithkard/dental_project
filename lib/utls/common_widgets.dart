import 'package:dental_surway/model/quizz_model_class.dart';
import 'package:dental_surway/res/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 70, // allows custom widget size
      titleSpacing: 0,

      leading: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => Get.back(),
          child: Container(
            width: 41,
            height: 41,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(0xFFE8ECF4),
                width: 1,
              ),
              color: Colors.white,
            ),
            child: Center(
              child: SvgPicture.asset(
                backArrow,
                width: 19,
                height: 19,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}


class AppInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboard;

  const AppInputField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboard = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.rubik(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboard,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF7F8F9),
            hintText: "Enter your $label".toLowerCase(),
            hintStyle: GoogleFonts.rubik(
              color: Colors.grey,
              fontSize: 14,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFE8ECF4),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFF0A61FF),
                width: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0A61FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: GoogleFonts.rubik(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class OtpBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;

  const OtpBox({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: GoogleFonts.rubik(fontSize: 22, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: const Color(0xFFF7F8F9),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xFF0A61FF),
              width: 1.4,
            ),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
      ),
    );
  }
}

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final Widget icon;
  final Color iconBg;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconBg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.rubik(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: GoogleFonts.rubik(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: icon,
          ),
        ],
      ),
    );
  }
}

class StudentScoreTile extends StatelessWidget {
  final String? name;
  final Summary? summary;

  const StudentScoreTile({
    super.key,
    required this.name,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    final bool passed = summary?.passed ?? false;

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Student Name + Status Badge
          Row(
            children: [
              Expanded(
                child: Text(
                  name ?? "Unknown Student",
                  style: GoogleFonts.rubik(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: passed ? Colors.green.shade100 : Colors.red.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  passed ? "PASSED" : "FAILED",
                  style: GoogleFonts.rubik(
                    color: passed ? Colors.green.shade800 : Colors.red.shade800,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Score Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _statItem("Score",
                (summary?.score ?? 0).toString(),
                Icons.star,
                Colors.orange,
              ),
              _statItem("Correct",
                (summary?.correct ?? 0).toString(),
                Icons.check_circle,
                Colors.green,
              ),
              _statItem("Wrong",
                (summary?.wrong ?? 0).toString(),
                Icons.cancel,
                Colors.red,
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Total Questions
          Row(
            children: [
              Icon(Icons.help_outline, color: Colors.blue.shade700, size: 20),
              const SizedBox(width: 8),
              Text(
                "Total Questions: ${summary?.totalQuestions ?? 0}",
                style: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Completed Date
          Row(
            children: [
              Icon(Icons.access_time, color: Colors.grey.shade700, size: 18),
              const SizedBox(width: 8),
              Text(
                _formatDateSafe(summary?.completedAt),
                style: GoogleFonts.rubik(fontSize: 13, color: Colors.grey.shade600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statItem(String label, String value, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        Text(
          label,
          style: GoogleFonts.rubik(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  String _formatDateSafe(String? dateString) {
    if (dateString == null || dateString.isEmpty) return "Not Available";

    try {
      final date = DateTime.parse(dateString);
      return "${date.day}-${date.month}-${date.year} ${date.hour}:${date.minute}";
    } catch (e) {
      return "Invalid Date";
    }
  }
}

class AdminBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int index) onTap;

  const AdminBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          navItem(icon: Icons.grid_view_rounded, label: "Overview", index: 0),
          navItem(icon: Icons.help_center, label: "Questions", index: 1),
          navItem(icon: Icons.person_outline, label: "Profile", index: 2),
        ],
      ),
    );
  }

  Widget navItem({required IconData icon, required String label, required int index}) {
    final isActive = index == currentIndex;

    return InkWell(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 26,
            color: isActive ? const Color(0xFF0A61FF) : Colors.grey,
          ),
          Text(
            label,
            style: GoogleFonts.rubik(
              fontSize: 12,
              color: isActive ? const Color(0xFF0A61FF) : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}


class StudentBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int index) onTap;

  const StudentBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          navItem(Icons.grid_view_rounded, "Overview", 0),
          navItem(Icons.person_outline, "Profile", 1),
        ],
      ),
    );
  }

  Widget navItem(IconData icon, String label, int index) {
    final bool active = currentIndex == index;

    return InkWell(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 26,
            color: active ? const Color(0xFF0A61FF) : Colors.grey,
          ),
          Text(
            label,
            style: GoogleFonts.rubik(
              fontSize: 12,
              color: active ? const Color(0xFF0A61FF) : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}


class AnswerButton extends StatelessWidget {
  final bool selected;
  final String label;
  final VoidCallback onTap;

  const AnswerButton({
    super.key,
    required this.selected,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFFEAF2FF) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selected ? const Color(0xFF0A61FF) : const Color(0xFFE2E4EB),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                selected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: selected ? const Color(0xFF0A61FF) : Colors.grey,
                size: 20,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: GoogleFonts.rubik(
                  color:
                  selected ? const Color(0xFF0A61FF) : Colors.grey.shade700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}