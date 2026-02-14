import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_sizes.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/shared/utils/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xFF0F172B),
                  Color(0x660F172B),
                  Color(0x00000000),
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 265.h,
          left: AppSizes.defaultPadding.w,
          right: AppSizes.defaultPadding.w,
          child: Text(
            title,
            style: AppStyles.customSize(
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          bottom: 190.h,
          left: AppSizes.defaultPadding.w,
          right: AppSizes.defaultPadding.w,
          child: Text(
            description,
            style: AppStyles.h3(color: AppColors.lightGreyColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
