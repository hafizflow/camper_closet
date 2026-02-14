import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_sizes.dart';
import 'package:flutter_extension/features/onboarding/controllers/onboarding_controller.dart';
import 'package:flutter_extension/features/onboarding/widgets/intro_component.dart';
import 'package:flutter_extension/shared/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OnboardingController>(
        builder: (logic) {
          return Stack(
            children: [
              PageView.builder(
                controller: logic.pageController,
                itemCount: logic.pages.length,
                onPageChanged: logic.onPageChanged,
                itemBuilder: (context, index) {
                  final page = logic.pages[index];
                  return IntroComponent(
                    title: page.title,
                    description: page.description,
                    imagePath: page.imagePath,
                  );
                },
              ),

              Positioned(
                bottom: 164.h,
                left: 0,
                right: 0,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: logic.pageController,
                    count: logic.pages.length,
                    effect: const ExpandingDotsEffect(
                      expansionFactor: 6,
                      spacing: 8.0,
                      radius: 7.0,
                      dotWidth: 6.0,
                      dotHeight: 6.0,
                      dotColor: Colors.white,
                      activeDotColor: Colors.white,
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 64.h,
                left: AppSizes.defaultPadding.w,
                right: AppSizes.defaultPadding.w,
                child: CustomButton(
                  onTap: () => logic.nextPage(),
                  text: logic.isLastPage() ? "Let's get started" : "Next",
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
