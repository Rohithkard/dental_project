//common widgets:
//title text
import 'package:dental_surway/ui/select_lang/bind/sel_lang_bind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleText extends StatelessWidget {
  final String text;

  const TitleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

// Language Image Widget
class LanguageImage extends StatelessWidget {
  final String imagePath;

  const LanguageImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade200,
      ),
      child: ClipOval(
        child: imagePath.isNotEmpty
            ? Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.language, size: 35, color: Colors.grey);
          },
        )
            : const Icon(Icons.language, size: 35, color: Colors.grey),
      ),
    );
  }
}


// Language Text Widget
class LanguageText extends StatelessWidget {
  final String text;

  const LanguageText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Color(0xFF666666),
      ),
    );
  }
}
// Custom Radio Button Widget
class CustomRadioButton extends StatelessWidget {
  final bool isSelected;

  const CustomRadioButton({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey.shade400,
          width: 2,
        ),
        color: Colors.white,
      ),
      child: isSelected
          ? Center(
        child: Container(
          width: 12,
          height: 12,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
        ),
      )
          : null,
    );
  }
}

// Language Item Widget
class LanguageItem extends StatelessWidget {
  final String languageName;
  final String imagePath;
  final SelectLangController controller;

  const LanguageItem({
    Key? key,
    required this.languageName,
    required this.imagePath,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => InkWell(
        onTap: () => controller.selectLanguage(languageName),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              LanguageImage(imagePath: imagePath),
              const SizedBox(width: 16),
              Expanded(
                child: LanguageText(text: languageName),
              ),
              CustomRadioButton(
                isSelected: controller.selectedLanguage.value == languageName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Continue Button Widget
class ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ContinueButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0066FF),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Continue',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}





