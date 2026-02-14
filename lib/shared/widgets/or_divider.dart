import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/shared/utils/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
