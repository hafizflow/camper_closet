import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_extension/core/constants/app_sizes.dart';
import 'package:flutter_extension/core/routes/app_pages.dart';
import 'package:flutter_extension/features/login/controllers/login_controller.dart';
import 'package:flutter_extension/shared/utils/app_style.dart';
import 'package:flutter_extension/shared/widgets/custom_button.dart';
import 'package:flutter_extension/shared/widgets/custom_checkbox.dart';
import 'package:flutter_extension/shared/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 55.h),
                SvgPicture.asset(AppLogos.applogo, width: 100.w, height: 65.h),
                SizedBox(height: 30.h),
                Text(
                  "Welcome Back!",
                  style: AppStyles.customSize(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Login to your account",
                  style: AppStyles.h5(color: AppColors.secondaryText),
                ),
                SizedBox(height: 40.h),

                //? ------- Email Field ------- //?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: AppStyles.h6(color: AppColors.primaryText),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      controller: controller.emailController,
                      prefixIcon: AppLogos.mail,
                      hintText: "Enter your email",
                      isEmail: true,
                      onValidationError: (error) {
                        controller.emailError.value = error ?? '';
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    // Error Text - Only shown when there's an error
                    Obx(
                      () => controller.emailError.value.isNotEmpty
                          ? Text(
                              controller.emailError.value,
                              style: AppStyles.customSize(
                                color: AppColors.errorColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ).paddingTop(5.h)
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                //? ------- Password Field ------- //?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: AppStyles.h6(color: AppColors.primaryText),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      controller: controller.passwordController,
                      prefixIcon: AppLogos.lock,
                      hintText: "Enter your password",
                      isPassword: true,
                      onValidationError: (error) {
                        controller.passwordError.value = error ?? '';
                      },
                      textInputAction: TextInputAction.done,
                    ),
                    // Error Text - Only shown when there's an error
                    Obx(
                      () => controller.passwordError.value.isNotEmpty
                          ? Text(
                              controller.passwordError.value,
                              style: AppStyles.customSize(
                                color: AppColors.errorColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ).paddingTop(5.h)
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),

                SizedBox(height: 12.h),
                Row(
                  children: [
                    Obx(
                      () => CustomCheckbox(
                        value: controller.rememberMe.value,
                        onChanged: (val) => controller.toggleRememberMe(),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "Remember me",
                      style: AppStyles.customSize(
                        color: AppColors.primaryText,
                        fontSize: 12.sp,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        // Navigate to forgot password
                      },
                      child: Text(
                        "Forgot Password?",
                        style: AppStyles.customSize(
                          color: AppColors.primaryText,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),

                // CustomButton(
                //   onTap: controller.validateAndLogin,
                //   text: 'Sign In',
                //   fontSize: 18.sp,
                //   height: 44.h,
                //   radius: 16.r,
                // ),
                Obx(
                  () => CustomButton(
                    onTap: controller.isLoading.value
                        ? null
                        : controller.validateAndLogin,
                    text: controller.isLoading.value
                        ? 'Signing In...'
                        : 'Sign In',
                    fontSize: 18.sp,
                    height: 44.h,
                    radius: 16.r,
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.greyDivider)),
                    Text(
                      'OR',
                      style: AppStyles.customSize(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryText,
                      ),
                    ).paddingHorizontal(16.w),
                    Expanded(child: Divider(color: AppColors.greyDivider)),
                  ],
                ),
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialButton(() {}, AppLogos.googlelogo),
                    SizedBox(width: 20.w),
                    _socialButton(() {}, AppLogos.applelogo),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: AppStyles.customSize(
                        color: AppColors.primaryText,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(AppPages.signupScreen),
                      child: Text(
                        "Sign Up",
                        style: AppStyles.customSize(
                          color: AppColors.primaryColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ).paddingTop(25.h),
              ],
            ).paddingHorizontal(AppSizes.defaultPadding),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(VoidCallback? onTap, String icon) {
    final radius = 100.r;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: AppColors.borderColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: SvgPicture.asset(icon, width: 24.w, height: 24.h),
        ),
      ),
    );
  }
}
