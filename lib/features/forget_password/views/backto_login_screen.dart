import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_extension/core/routes/app_pages.dart';
import 'package:flutter_extension/shared/utils/app_style.dart';
import 'package:flutter_extension/shared/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BacktoLoginScreen extends StatelessWidget {
  const BacktoLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 235.h),
                SvgPicture.asset(AppLogos.applogo, width: 100.w, height: 65.h),
                SizedBox(height: 30.h),
                Text(
                  'Password changed',
                  textAlign: TextAlign.center,
                  style: AppStyles.customSize(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Your password has been changed successfully',
                  textAlign: TextAlign.center,
                  style: AppStyles.customSize(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryText,
                  ),
                ),
                SizedBox(height: 50.h),
                CustomButton(
                  onTap: () => Get.back(),
                  text: 'Back to Login',
                  fontSize: 18.sp,
                  height: 44.h,
                  radius: 16.r,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
