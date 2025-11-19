import 'package:dental_surway/utls/app_pages.dart';
import 'package:dental_surway/utls/com_binding.dart';
import 'package:dental_surway/utls/routes.dart';
import 'package:dental_surway/utls/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  await GetStorage.init('dental');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      init: AppController(),
      builder: (logic) {
        return GetMaterialApp(
          title: 'Dental',
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splash,
          defaultTransition: Transition.noTransition,
          initialBinding: ComBinding(),

          // ---------------------------
          // Theming
          // ---------------------------
          theme: ThemeData(
            textTheme: GoogleFonts.rubikTextTheme(),
            useMaterial3: true,
          ),

          getPages: AppPages.pages,

          // ---------------------------
          // Global Builder
          // ---------------------------
          builder: EasyLoading.init(
            builder: (context, child) {
              final mq = MediaQuery.of(context);

              // Desktop/wide screen → bigger text
              // Mobile → slightly smaller
              final scale = mq.size.width > 900 ? 1.1 : 0.9;

              return MediaQuery(
                data: mq.copyWith(
                  textScaler: TextScaler.linear(scale),
                ),
                child: child ?? const SizedBox.shrink(),
              );
            },
          ),
        );
      },
    );
  }
}


