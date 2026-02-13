import 'package:flutter/material.dart';
import 'package:flutter_extension/shared/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();

  final List<Map<String, String>> _pagesData = [
    {
      "title": "Pack once. Stay organized.",
      "description": "Create packing lists and track everything in one place.",
      "imagePath": "assets/images/onboarding1.jpg",
    },
    {
      "title": "Your closet, simplified.",
      "description": "Add items by photo and remember size, color, and brand.",
      "imagePath": "assets/images/onboarding2.jpg",
    },
    {
      "title": "Ready for camp, travel, and everyday life.",
      "description": "Everything you need, packed and ready.",
      "imagePath": "assets/images/onboarding3.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller, // Add this!
            itemCount: _pagesData.length,
            itemBuilder: (context, index) {
              return IntroComponent(
                title: _pagesData[index]["title"]!,
                description: _pagesData[index]["description"]!,
                imagePath: _pagesData[index]["imagePath"]!,
              );
            },
          ),
          Positioned(
            bottom: 164.h,
            left: 159.5.w,
            right: 159.5.w,
            child: Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                axisDirection: Axis.horizontal,
                effect: const ExpandingDotsEffect(
                  expansionFactor: 6,
                  spacing: 8.0,
                  radius: 7.0,
                  dotWidth: 6.0,
                  dotHeight: 6.0,
                  strokeWidth: 1.5,
                  dotColor: Colors.white,
                  activeDotColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class IntroComponent extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const IntroComponent({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Positioned(
          bottom: 265.h,
          left: 24.w,
          right: 24.w,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          bottom: 189.85.h,
          left: 24.w,
          right: 24.w,
          child: Text(
            description,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.lightGreyColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
