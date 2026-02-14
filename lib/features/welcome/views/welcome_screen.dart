import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_extension/core/constants/app_sizes.dart';
import 'package:flutter_extension/shared/utils/app_style.dart';
import 'package:flutter_extension/shared/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../core/routes/app_pages.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 150.h),
            SvgPicture.asset(AppLogos.welcomelogo, width: 134.w, height: 134.h),
            SizedBox(height: 20.h),
            Text(
              'All Packed',
              style: AppStyles.customSize(
                fontSize: 52.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 13.h),
            Text(
              'Manage packing, closets, and reminders in one place.',
              textAlign: TextAlign.center,
              style: AppStyles.customSize(
                fontSize: 19.sp,
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 155.h),
            CustomButton(
              onTap: () => Get.offNamed(AppPages.signupScreen),
              text: "Create Account",
            ),
            SizedBox(height: 21.h),
            Row(
              spacing: 16.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I already have an account? ",
                  style: AppStyles.customSize(
                    fontSize: 15.sp,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.offNamed(AppPages.loginScreen),
                  child: Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: AppColors.buttonPrimaryColor,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ).paddingHorizontal(AppSizes.defaultPadding.w),
      ),
    );
  }
}
