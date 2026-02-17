import 'package:exui/exui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_extension/core/constants/app_sizes.dart';
import 'package:flutter_extension/core/routes/app_pages.dart';
import 'package:flutter_extension/features/signup/controllers/signup_controller.dart';
import 'package:flutter_extension/features/signup/widgets/labeled_date_picker.dart';
import 'package:flutter_extension/shared/widgets/labeled_text_field.dart';
import 'package:flutter_extension/shared/widgets/or_divider.dart';
import 'package:flutter_extension/shared/widgets/social_button.dart';
import 'package:flutter_extension/shared/utils/app_style.dart';
import 'package:flutter_extension/shared/widgets/custom_button.dart';
import 'package:flutter_extension/shared/widgets/custom_checkbox.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              Text(
                "Create an account",
                style: AppStyles.customSize(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryText,
                ),
              ),
              Text(
                "Please sign up your account",
                style: AppStyles.h5(color: AppColors.secondaryText),
              ),
              SizedBox(height: 20.h),

              // Full Name Field
              LabeledTextField(
                label: "Name",
                controller: controller.fullNameController,
                prefixIcon: AppLogos.person,
                hintText: "Enter your full name",
                errorMessage: controller.fullNameError,
              ),

              // Email Field
              LabeledTextField(
                label: "Email",
                controller: controller.emailController,
                prefixIcon: AppLogos.mail,
                hintText: "Enter your email",
                isEmail: true,
                errorMessage: controller.emailError,
              ),

              // Date of Birth Field
              LabeledDatePicker(
                label: "Date of Birth",
                controller: controller.dobController,
                prefixIcon: AppLogos.calendar,
                hintText: "DD/MM/YYYY",
                errorMessage: controller.dobError,
              ),

              // Password Field
              LabeledTextField(
                label: "Password",
                controller: controller.passwordController,
                prefixIcon: AppLogos.lock,
                hintText: "Enter your password",
                isPassword: true,
                errorMessage: controller.passwordError,
              ),

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

              _termsAndPolicy(controller).paddingBottom(30.h),

              Obx(
                () => CustomButton(
                  onTap: controller.validateAndSignup,
                  text: controller.isLoading.value
                      ? 'Creating Account...'
                      : 'Sign Up',
                  loading: controller.isLoading.value,
                  fontSize: 18.sp,
                  height: 44.h,
                  radius: 16.r,
                ),
              ),

              SizedBox(height: 20.h),
              const OrDivider(),
              SizedBox(height: 20.h),

              SocialAuthButtons(
                googleIcon: AppLogos.googlelogo,
                appleIcon: AppLogos.applelogo,
                onGoogleTap: () {
                  // Handle Google sign in
                },
                onAppleTap: () {
                  // Handle Apple sign in
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account? ",
                    style: AppStyles.customSize(
                      color: AppColors.primaryText,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.offNamed(AppPages.loginScreen),
                    child: Text(
                      "Sign In",
                      style: AppStyles.customSize(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ).paddingTop(20.h),
              SizedBox(height: 30.h),
            ],
          ).paddingHorizontal(AppSizes.defaultPadding),
        ),
      ),
    );
  }

  Widget _termsAndPolicy(SignupController controller) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => CustomCheckbox(
            value: controller.acceptedTerms.value,
            onChanged: (val) => controller.toggleTermsAcceptance(),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.inter(
                color: AppColors.primaryText,
                fontSize: 12.sp,
              ),
              children: [
                const TextSpan(text: "I agree with "),
                TextSpan(
                  text: "terms & conditions ",
                  style: GoogleFonts.inter(
                    color: AppColors.buttonPrimaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                const TextSpan(text: "and "),
                TextSpan(
                  text: "privacy policy",
                  style: GoogleFonts.inter(
                    color: AppColors.buttonPrimaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
