import 'package:dental_surway/ui/splash/bind/splash_bind.dart';
import 'package:dental_surway/ui/splash/view/splash_view.dart';
import 'package:dental_surway/utls/routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () =>  SplashView(),
      binding: SplashBinding(),
    ),
    ];}