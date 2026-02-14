import 'package:exui/exui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_extension/core/constants/app_sizes.dart';
import 'package:flutter_extension/core/routes/app_pages.dart';
import 'package:flutter_extension/features/signup/controllers/signup_controller.dart';
import 'package:flutter_extension/shared/utils/app_style.dart';
import 'package:flutter_extension/shared/widgets/custom_button.dart';
import 'package:flutter_extension/shared/widgets/custom_checkbox.dart';
import 'package:flutter_extension/shared/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            // key: controller.formKey,
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
                SizedBox(height: 10.h),
                Text(
                  "Please sign up your account",
                  style: AppStyles.h5(color: AppColors.secondaryText),
                ),
                SizedBox(height: 20.h),

                //? ------- Full Name Field ------- //?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Full Name",
                      style: AppStyles.h6(color: AppColors.primaryText),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      controller: controller.fullNameController,
                      prefixIcon: AppLogos.person,
                      hintText: "Enter your full name",
                      isEmail: false,
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                      onValidationError: (error) {
                        controller.fullNameError.value = error ?? '';
                      },
                    ),
                    Obx(
                      () => controller.fullNameError.value.isNotEmpty
                          ? Text(
                              controller.fullNameError.value,
                              style: AppStyles.customSize(
                                color: AppColors.errorColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ).paddingTop(5.h)
                          : const SizedBox.shrink(),
                    ),
                  ],
                ).paddingBottom(12.h),

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
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                      onValidationError: (error) {
                        controller.emailError.value = error ?? '';
                      },
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
                ).paddingBottom(12.h),

                //? ------- Date of birth ------- //?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date of Birth",
                      style: AppStyles.h6(color: AppColors.primaryText),
                    ),
                    SizedBox(height: 5.h),
                    // const SingleDatePicker(),
                    GestureDetector(
                      onTap: () async {
                        // Close keyboard if open
                        FocusScope.of(context).unfocus();

                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now().subtract(
                            const Duration(days: 365 * 18),
                          ), // 18 years ago
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: AppColors.primaryColor,
                                  onPrimary: Colors.white,
                                  surface: Colors.white,
                                  onSurface: AppColors.primaryText,
                                ),
                                dialogTheme: const DialogThemeData(
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );

                        if (picked != null) {
                          // Format: DD/MM/YYYY
                          final formattedDate =
                              '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
                          controller.dobController.text = formattedDate;
                          // Clear error when date is selected
                          controller.dobError.value = '';
                        }
                      },
                      child: AbsorbPointer(
                        // This prevents the keyboard from showing
                        child: CustomTextField(
                          controller: controller.dobController,
                          prefixIcon: AppLogos.calendar,
                          hintText: "DD/MM/YYYY",
                          isEmail: false,
                          isPassword: false,
                          textInputAction: TextInputAction.next,
                          onValidationError: (error) {
                            controller.dobError.value = error ?? '';
                          },
                        ),
                      ),
                    ),
                    Obx(
                      () => controller.dobError.value.isNotEmpty
                          ? Text(
                              controller.dobError.value,
                              style: AppStyles.customSize(
                                color: AppColors.errorColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ).paddingTop(5.h)
                          : const SizedBox.shrink(),
                    ),
                  ],
                ).paddingBottom(12.h),

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
                      textInputAction: TextInputAction.next,
                      onValidationError: (error) {
                        controller.passwordError.value = error ?? '';
                      },
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
                ).paddingBottom(12.h),

                //? ------- Password Field ------- //?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Confirm Password",
                      style: AppStyles.h6(color: AppColors.primaryText),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      controller: controller.confirmPasswordController,
                      prefixIcon: AppLogos.lock,
                      hintText: "Confirm your password",
                      isPassword: true,
                      textInputAction: TextInputAction.done,
                      onValidationError: (error) {
                        controller.confirmPasswordError.value = error ?? '';
                      },
                    ),
                    // Error Text - Only shown when there's an error
                    Obx(
                      () => controller.confirmPasswordError.value.isNotEmpty
                          ? Text(
                              controller.confirmPasswordError.value,
                              style: AppStyles.customSize(
                                color: AppColors.errorColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ).paddingTop(5.h)
                          : const SizedBox.shrink(),
                    ),
                  ],
                ).paddingBottom(12.h),

                _termsAndPolicy(controller).paddingBottom(30.h),

                Obx(
                  () => CustomButton(
                    onTap: controller.isLoading.value
                        ? null
                        : controller.validateAndSignup,
                    text: controller.isLoading.value
                        ? 'Creating Account...'
                        : 'Sign Up',
                    fontSize: 18.sp,
                    height: 44.h,
                    radius: 16.r,
                  ),
                ),
                SizedBox(height: 20.h),
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
                SizedBox(height: 20.h),
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
                      "Have an account? ",
                      style: AppStyles.customSize(
                        color: AppColors.primaryText,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(AppPages.loginScreen),
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
      ),
    );
  }

  Widget _termsAndPolicy(SignupController controller) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              style: AppStyles.customSize(
                color: AppColors.primaryText,
                fontSize: 12.sp,
              ),
              children: [
                const TextSpan(text: "I agree with "),
                TextSpan(
                  text: "terms & conditions ",
                  style: AppStyles.customSize(
                    color: AppColors.buttonPrimaryColor,
                    fontSize: 12.sp,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // open terms
                    },
                ),
                const TextSpan(text: "and "),
                TextSpan(
                  text: "privacy policy",
                  style: AppStyles.customSize(
                    color: AppColors.buttonPrimaryColor,
                    fontSize: 12.sp,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // open privacy policy
                    },
                ),
              ],
            ),
          ),
        ),
      ],
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
