import 'package:flutter_extension/core/routes/app_pages.dart';
import 'package:flutter_extension/features/forget_password/controllers/otp_controller.dart';
import 'package:flutter_extension/features/forget_password/controllers/request_password_controller.dart';
import 'package:flutter_extension/features/forget_password/controllers/reset_password_controller.dart';
import 'package:flutter_extension/features/forget_password/views/backto_login_screen.dart';
import 'package:flutter_extension/features/forget_password/views/otp_screen.dart';
import 'package:flutter_extension/features/forget_password/views/request_password_screen.dart';
import 'package:flutter_extension/features/forget_password/views/reset_password_screen.dart';
import 'package:flutter_extension/features/home/controllers/home_controller.dart';
import 'package:flutter_extension/features/home/views/home_screen.dart';
import 'package:flutter_extension/features/login/controllers/login_controller.dart';
import 'package:flutter_extension/features/login/views/login_screen.dart';
import 'package:flutter_extension/features/nav/controllers/nav_controller.dart';
import 'package:flutter_extension/features/nav/views/nav_screen.dart';
import 'package:flutter_extension/features/onboarding/controllers/onboarding_controller.dart';
import 'package:flutter_extension/features/onboarding/views/onboarding_screen.dart';
import 'package:flutter_extension/features/signup/controllers/signup_controller.dart';
import 'package:flutter_extension/features/signup/views/signup_screen.dart';
import 'package:flutter_extension/features/splash/controllers/splash_controller.dart';
import 'package:flutter_extension/features/splash/views/splash_screen.dart';
import 'package:flutter_extension/features/welcome/views/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  static List<GetPage> page = [
    GetPage(
      name: AppPages.splashScreen,
      page: () => const SplashScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => SplashController());
      }),
    ),

    GetPage(
      name: AppPages.navbarScreen,
      page: () => const NavScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => NavController());
        Get.lazyPut(() => HomeController());
      }),
    ),

    GetPage(
      name: AppPages.homeScreen,
      page: () => const HomeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
      }),
    ),
    GetPage(
      name: AppPages.onboardingScreen,
      page: () => const OnboardingScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => OnboardingController());
      }),
    ),
    GetPage(name: AppPages.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
      name: AppPages.loginScreen,
      page: () => const LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
      }),
    ),
    GetPage(
      name: AppPages.signupScreen,
      page: () => const SignupScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => SignupController());
      }),
    ),
    GetPage(
      name: AppPages.requestPasswordScreen,
      page: () => const RequestPasswordScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => RequestPasswordController());
      }),
    ),
    GetPage(
      name: AppPages.otpScreen,
      page: () => const OtpScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => OtpController());
      }),
    ),
    GetPage(
      name: AppPages.resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ResetPasswordController());
      }),
    ),
    GetPage(
      name: AppPages.backTologinScreen,
      page: () => const BacktoLoginScreen(),
    ),
  ];
}
