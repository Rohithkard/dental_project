import 'package:dental_surway/ui/admin_dashboard/bind/admin_dashboard_controller.dart';
import 'package:dental_surway/ui/admin_dashboard/view/admin_view.dart';
import 'package:dental_surway/ui/admin_login/bind/admin_login_bind.dart';
import 'package:dental_surway/ui/admin_login/view/admin_login_view.dart';
import 'package:dental_surway/ui/admin_nav_dashboard/bind/admin_nav_bind.dart';
import 'package:dental_surway/ui/admin_nav_dashboard/view/view.dart';
import 'package:dental_surway/ui/admin_profile/bind/admin_profile_bind.dart';
import 'package:dental_surway/ui/admin_profile/view/admin_profile_view.dart';
import 'package:dental_surway/ui/questions/bind/questions_controller.dart';
import 'package:dental_surway/ui/questions/view/question_view.dart';
import 'package:dental_surway/ui/select_lang/bind/sel_lang_bind.dart';
import 'package:dental_surway/ui/select_lang/view/sel_lang_view.dart';
import 'package:dental_surway/ui/splash/bind/splash_bind.dart';
import 'package:dental_surway/ui/splash/view/splash_view.dart';
import 'package:dental_surway/ui/student_login/bind/student_login_bind.dart';
import 'package:dental_surway/ui/student_login/view/student_login_view.dart';
import 'package:dental_surway/ui/student_otp/bind/student_otp_bind.dart';
import 'package:dental_surway/ui/student_otp/view/student_otp_view.dart';
import 'package:dental_surway/ui/student_reg/bind/student_reg_bind.dart';
import 'package:dental_surway/ui/student_reg/view/student_reg_view.dart';
import 'package:dental_surway/utls/routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.studentLogin,
      page: () => StudentLoginView(),
      binding: StudentLoginBinding(),
    ),
    GetPage(
      name: Routes.studentOtp,
      page: () => StudentOtpView(),
      binding: StudentOtpBinding(),
    ),
    GetPage(
      name: Routes.adminLoginRoute,
      page: () => AdminLoginView(),
      binding: AdminLoginBind(),
    ),
    GetPage(
      name: Routes.studentRegRoute,
      page: () => StudentRegView(),
      binding: StudentRegBind(),
    ),
    GetPage(
      name: Routes.selLangRoute,
      page: () => SelectLanguageView(),
      binding: SelectLanguageBinding(),
    ),
    GetPage(
      name: Routes.adminDashBoardRoute,
      page: () => AdminDashboardView(),
      binding: AdminDashboardBinding(),
    ),
    GetPage(
      name: Routes.questionRoute,
      page: () => QuestionsView(),
      binding: QuestinBind(),
    ),
    GetPage(
      name: Routes.mainAdminRoute,
      page: () => AdminHomeView(),
      binding: AdminNavBinding(),
    ),
    GetPage(
      name: Routes.adminProfileRoute,
      page: () => AdminProfileView(),
      binding: AdminProfileBind(),
    ),
  ];
}
