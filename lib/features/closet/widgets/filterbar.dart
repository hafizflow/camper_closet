import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/features/closet/controllers/item_controller.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterBar extends StatelessWidget {
  final ItemsController ctrl;
  const FilterBar({super.key, required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final tabs = ctrl.filterTabs;
      return SizedBox(
        height: 52.h,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          scrollDirection: Axis.horizontal,
          itemCount: tabs.length,
          separatorBuilder: (_, __) => SizedBox(width: 10.w),
          itemBuilder: (_, i) {
            final tab = tabs[i];
            final active = ctrl.selectedFilter.value == tab;
            final count = ctrl.countFor(tab);
            return GestureDetector(
              onTap: () => ctrl.setFilter(tab),
              child: InnerShadow(
                shadows: [
                  Shadow(
                    color: AppColors.successColor.withValues(alpha: 0.4),
                    blurRadius: 15,
                  ),
                ],
                child: AnimatedContainer(
                  width: 75.w,
                  height: 32.h,
                  duration: const Duration(milliseconds: 180),
                  decoration: BoxDecoration(
                    color: active ? AppColors.successColor : Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$tab ($count)",
                        style: GoogleFonts.inter(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: active ? Colors.white : AppColors.primaryText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
