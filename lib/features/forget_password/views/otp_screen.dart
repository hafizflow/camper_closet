import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_extension/features/forget_password/controllers/otp_controller.dart';
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
    final controller = Get.put(OtpController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 166.h),
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
                Obx(
                  () => Text(
                    'We\'ve sent a code to ${controller.userEmail.value.isEmpty ? 'prayasjvai@gmail.com' : controller.userEmail.value}',
                    textAlign: TextAlign.center,
                    style: AppStyles.customSize(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                Pinput(
                  controller: controller.otpController,
                  length: 4,
                  separatorBuilder: (index) => SizedBox(width: 17.w),
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
                  focusedPinTheme: PinTheme(
                    width: 40.w,
                    height: 50.h,
                    textStyle: AppStyles.customSize(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.primaryText,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  onChanged: controller.onOtpChanged,
                  onCompleted: (value) {
                    // Auto-submit when all 4 digits are entered
                    controller.validateAndSubmitOtp();
                  },
                ),
                SizedBox(height: 30.h),
                Obx(
                  () => CustomButton(
                    onTap: controller.isLoading.value
                        ? null
                        : controller.validateAndSubmitOtp,
                    text: controller.isLoading.value
                        ? 'Submitting...'
                        : 'Submit Code',
                    fontSize: 18.sp,
                    height: 44.h,
                    radius: 16.r,
                  ),
                ),
                SizedBox(height: 20.h),
                // Timer and Resend code option
                Obx(
                  () => controller.canResend.value
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Didn\'t receive the code? ',
                              style: AppStyles.customSize(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryText,
                              ),
                            ),
                            GestureDetector(
                              onTap: controller.isLoading.value
                                  ? null
                                  : controller.resendOtp,
                              child: Text(
                                'Resend',
                                style: AppStyles.customSize(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.buttonPrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Send code again ',
                              style: AppStyles.customSize(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryText,
                              ),
                            ),
                            Text(
                              controller.formattedTime,
                              style: AppStyles.customSize(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.buttonPrimaryColor,
                              ),
                            ),
                          ],
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
