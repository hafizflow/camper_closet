// templates_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_extension/features/closet/controllers/tetmplate_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/template_model.dart';

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(TemplatesController());

    return Obx(() {
      if (ctrl.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),

            // Hero banner
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 28.h),
              decoration: BoxDecoration(
                color: const Color(0xFFEEF4FF),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Column(
                children: [
                  Container(
                    width: 56.w,
                    height: 56.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD6E4FF),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Icon(
                      Icons.auto_awesome,
                      color: const Color(0xFF2B7FFF),
                      size: 28.sp,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    'Ready-Made Templates',
                    style: GoogleFonts.sora(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1A1A2E),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Start with expert-curated packing lists',
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      color: const Color(0xFF90A1B9),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Section header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Templates',
                  style: GoogleFonts.sora(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1A1A2E),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Filter',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2B7FFF),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 14.h),

            // Template list
            ...ctrl.templates.map(
              (t) => _TemplateCard(template: t, ctrl: ctrl),
            ),

            SizedBox(height: 30.h),
          ],
        ),
      );
    });
  }
}

class _TemplateCard extends StatelessWidget {
  final TemplateModel template;
  final TemplatesController ctrl;

  const _TemplateCard({required this.template, required this.ctrl});

  Color get _bgColor {
    switch (template.iconCategory) {
      case 'camp':
        return const Color(0xFFE6F7EE);
      case 'travel':
        return const Color(0xFFEEF4FF);
      case 'school':
        return const Color(0xFFFFF8E6);
      default:
        return const Color(0xFFF3EEFF);
    }
  }

  Color get _iconColor {
    switch (template.iconCategory) {
      case 'camp':
        return const Color(0xFF22C55E);
      case 'travel':
        return const Color(0xFF2B7FFF);
      case 'school':
        return const Color(0xFFF5A623);
      default:
        return const Color(0xFF7C3AED);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: _bgColor,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              color: _iconColor,
              size: 24.sp,
            ),
          ),

          SizedBox(width: 14.w),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  template.title,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1A1A2E),
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  template.subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: const Color(0xFF90A1B9),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  '~${template.itemCount} ITEMS INCLUDED',
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: _iconColor,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 10.w),

          // Use button
          GestureDetector(
            onTap: () => ctrl.useTemplate(template),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Text(
                'Use',
                style: GoogleFonts.inter(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A1A2E),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
