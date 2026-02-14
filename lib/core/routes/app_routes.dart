import 'package:flutter_extension/core/routes/app_pages.dart';
import 'package:flutter_extension/features/home/views/home_screen.dart';
import 'package:flutter_extension/features/login/views/login_screen.dart';
import 'package:flutter_extension/features/onboarding/views/onboarding_screen.dart';
import 'package:flutter_extension/features/signup/views/signup_screen.dart';
import 'package:flutter_extension/features/splash/views/splash_screen.dart';
import 'package:flutter_extension/features/welcome/views/welcome_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  AppRoutes._();

  static List<GetPage> page = [
    GetPage(name: AppPages.splashScreen, page: () => const SplashScreen()),
    GetPage(name: AppPages.homeScreen, page: () => const HomeScreen()),
    GetPage(
      name: AppPages.onboardingScreen,
      page: () => const OnboardingScreen(),
    ),
    GetPage(name: AppPages.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(name: AppPages.loginScreen, page: () => const LoginScreen()),
    GetPage(name: AppPages.signupScreen, page: () => const SignupScreen()),
  ];
}
