import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_images.dart';
import 'package:flutter_extension/core/constants/app_strings.dart';
import 'package:flutter_extension/core/routes/app_pages.dart';
import 'package:flutter_extension/features/onboarding/models/onboarding_model.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var isLoggedIn = false;
  final PageController pageController = PageController();

  final List<OnboardingModel> pages = [
    OnboardingModel(
      title: AppStrings.onBoarding1title,
      description: AppStrings.onBoarding1description,
      imagePath: AppImages.onboarding1,
    ),
    OnboardingModel(
      title: AppStrings.onBoarding2title,
      description: AppStrings.onBoarding2description,
      imagePath: AppImages.onboarding2,
    ),
    OnboardingModel(
      title: AppStrings.onBoarding3title,
      description: AppStrings.onBoarding3description,
      imagePath: AppImages.onboarding3,
    ),
  ];

  int currentIndex = 0;

  void onPageChanged(int index) {
    currentIndex = index;
    update();
  }

  void nextPage() {
    if (currentIndex < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      if (isLoggedIn) {
        Get.offNamed(AppPages.homeScreen);
      } else {
        Get.offNamed(AppPages.welcomeScreen);
      }
    }
  }

  bool isLastPage() {
    return currentIndex == pages.length - 1;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
