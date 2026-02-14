import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialAuthButtons extends StatelessWidget {
  final VoidCallback? onGoogleTap;
  final VoidCallback? onAppleTap;
  final String googleIcon;
  final String appleIcon;

  const SocialAuthButtons({
    super.key,
    this.onGoogleTap,
    this.onAppleTap,
    required this.googleIcon,
    required this.appleIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialButton(onTap: onGoogleTap, icon: googleIcon),
        SizedBox(width: 20.w),
        _SocialButton(onTap: onAppleTap, icon: appleIcon),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String icon;

  const _SocialButton({required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
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
