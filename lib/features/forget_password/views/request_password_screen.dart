import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_extension/features/forget_password/controllers/request_password_controller.dart';
import 'package:flutter_extension/shared/utils/app_style.dart';
import 'package:flutter_extension/shared/widgets/custom_button.dart';
import 'package:flutter_extension/shared/widgets/labeled_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RequestPasswordScreen extends StatelessWidget {
  const RequestPasswordScreen({super.key});

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
                  'Request Password Reset',
                  textAlign: TextAlign.center,
                  style: AppStyles.customSize(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Don\'t worry! It happens. Please enter the email associated with your account.',
                  textAlign: TextAlign.center,
                  style: AppStyles.customSize(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryText,
                  ),
                ),
                SizedBox(height: 50.h),
                LabeledTextField(
                  label: "Email",
                  controller: controller.emailController,
                  prefixIcon: AppLogos.mail,
                  hintText: "Enter your email",
                  isEmail: true,
                  errorMessage: controller.emailError,
                  bottomPadding: 30,
                  textInputAction: TextInputAction.done,
                ),
                Obx(
                  () => CustomButton(
                    onTap: controller.isLoading.value
                        ? null
                        : controller.validateAndRequestReset,
                    text: controller.isLoading.value
                        ? 'Sending...'
                        : 'Send Code',
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
