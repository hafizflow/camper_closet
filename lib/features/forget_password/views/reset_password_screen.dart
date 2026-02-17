import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_extension/features/forget_password/controllers/reset_password_controller.dart';
import 'package:flutter_extension/shared/utils/app_style.dart';
import 'package:flutter_extension/shared/widgets/custom_button.dart';
import 'package:flutter_extension/shared/widgets/labeled_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResetPasswordController>();

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
                  'Reset Password',
                  textAlign: TextAlign.center,
                  style: AppStyles.customSize(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Please type something you’ll remember',
                  textAlign: TextAlign.center,
                  style: AppStyles.customSize(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryText,
                  ),
                ),
                SizedBox(height: 50.h),
                // Password Field
                LabeledTextField(
                  label: "Password",
                  controller: controller.passwordController,
                  prefixIcon: AppLogos.lock,
                  hintText: "Enter your password",
                  isPassword: true,
                  errorMessage: controller.passwordError,
                ),

                SizedBox(height: 10.h),
                // Confirm Password Field
                LabeledTextField(
                  label: "Confirm Password",
                  controller: controller.confirmPasswordController,
                  prefixIcon: AppLogos.lock,
                  hintText: "Confirm your password",
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  errorMessage: controller.confirmPasswordError,
                ),
                SizedBox(height: 20.h),
                Obx(
                  () => CustomButton(
                    onTap: controller.isLoading.value
                        ? null
                        : controller.validateAndRequestReset,
                    text: controller.isLoading.value
                        ? 'Submitting...'
                        : 'Submit',
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
