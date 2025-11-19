import 'package:dental_surway/ui/admin_login/bind/admin_login_bind.dart';
import 'package:dental_surway/ui/admin_login/view/admin_login_view.dart';
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
  ];
}
