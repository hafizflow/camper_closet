import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/shared/utils/app_style.dart';
import 'package:flutter_extension/shared/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String prefixIcon;
  final String hintText;
  final bool isEmail;
  final bool isPassword;
  final TextInputAction textInputAction;
  final RxString errorMessage;
  final double bottomPadding;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    required this.errorMessage,
    this.isEmail = false,
    this.isPassword = false,
    this.textInputAction = TextInputAction.next,
    this.bottomPadding = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.h6(color: AppColors.primaryText)),
        SizedBox(height: 5.h),
        CustomTextField(
          controller: controller,
          prefixIcon: prefixIcon,
          hintText: hintText,
          isEmail: isEmail,
          isPassword: isPassword,
          textInputAction: textInputAction,
          onValidationError: (error) {
            errorMessage.value = error ?? '';
          },
        ),
        Obx(
          () => errorMessage.value.isNotEmpty
              ? Text(
                  errorMessage.value,
                  style: AppStyles.customSize(
                    color: AppColors.errorColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ).paddingTop(5.h)
              : const SizedBox.shrink(),
        ),
      ],
    ).paddingBottom(bottomPadding.h);
  }
}
