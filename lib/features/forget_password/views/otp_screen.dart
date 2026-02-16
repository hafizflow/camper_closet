import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_extension/features/forget_password/controllers/request_password_controller.dart';
import 'package:flutter_extension/shared/utils/app_style.dart';
import 'package:flutter_extension/shared/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RequestPasswordController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 138.h),
                SvgPicture.asset(AppLogos.applogo, width: 100.w, height: 65.h),
                SizedBox(height: 30.h),
                Text(
                  'Please check your email',
                  textAlign: TextAlign.center,
                  style: AppStyles.customSize(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'We’ve sent a code to prayasjvai@gmail.com',
                  textAlign: TextAlign.center,
                  style: AppStyles.customSize(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryText,
                  ),
                ),
                SizedBox(height: 50.h),
                Pinput(
                  length: 4,
                  defaultPinTheme: PinTheme(
                    width: 40.w,
                    height: 50.h,
                    textStyle: AppStyles.customSize(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.borderColor),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    // Handle OTP input change if needed
                  },
                ),
                Obx(
                  () => CustomButton(
                    onTap: controller.isLoading.value
                        ? null
                        : controller.validateAndRequestReset,
                    text: controller.isLoading.value
                        ? 'Submitting...'
                        : 'Submit Code',
                    fontSize: 18.sp,
                    height: 44.h,
                    radius: 16.r,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
