import 'package:flutter_extension/core/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  jumpNextScreen() {
    Get.offNamed(AppPages.onboardingScreen);
  }
}
