import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ClosetHeader extends StatelessWidget {
  const ClosetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Text Column
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'My Closet',
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Everything organized, in one place.',
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ),
          ],
        ),

        // Custom Search Button
        Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withValues(alpha: 0.1),
                blurRadius: 20,
                spreadRadius: 5,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: SvgPicture.asset(AppLogos.search, width: 20, height: 20),
        ),
      ],
    ).paddingHorizontal(24.w).paddingTop(12.h);
  }
}
