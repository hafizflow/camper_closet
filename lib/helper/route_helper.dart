import 'package:flutter_extension/features/home/views/home_screen.dart';
import 'package:flutter_extension/features/onboarding/views/onboarding_screen.dart';
import 'package:get/get.dart';

import '../features/splash/views/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static String splashScreen = "/splash_screen";
  static String homeScreen = "/home_screen";
  static String onboardingScreen = "/onboarding_screen";

  static List<GetPage> page = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: onboardingScreen, page: () => const OnboardingScreen()),
  ];
}
