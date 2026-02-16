import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_extension/core/constants/app_sizes.dart';
import 'package:flutter_extension/core/routes/app_pages.dart';
import 'package:flutter_extension/features/login/controllers/login_controller.dart';
import 'package:flutter_extension/shared/widgets/labeled_text_field.dart';
import 'package:flutter_extension/shared/widgets/or_divider.dart';
import 'package:flutter_extension/shared/widgets/social_button.dart';
import 'package:flutter_extension/shared/utils/app_style.dart';
import 'package:flutter_extension/shared/widgets/custom_button.dart';
import 'package:flutter_extension/shared/widgets/custom_checkbox.dart';
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
                LabeledTextField(
                  label: "Email",
                  controller: controller.emailController,
                  prefixIcon: AppLogos.mail,
                  hintText: "Enter your email",
                  isEmail: true,
                  errorMessage: controller.emailError,
                  bottomPadding: 20,
                ),

                LabeledTextField(
                  label: "Password",
                  controller: controller.passwordController,
                  prefixIcon: AppLogos.lock,
                  hintText: "Enter your password",
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  errorMessage: controller.passwordError,
                  bottomPadding: 12,
                ),

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
                      onTap: () => Get.toNamed(AppPages.requestPasswordScreen),
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
                const OrDivider(),
                SizedBox(height: 25.h),
                const SocialAuthButtons(
                  googleIcon: AppLogos.googlelogo,
                  appleIcon: AppLogos.applelogo,
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
                      onTap: () => Get.offNamed(AppPages.signupScreen),
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
}
