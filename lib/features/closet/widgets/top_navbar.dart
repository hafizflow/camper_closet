import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_extension/features/closet/controllers/closet_tab_controller.dart';
import 'package:flutter_extension/features/closet/widgets/nav_tab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Updated TopNav with tab switching
class TopNav extends StatelessWidget {
  const TopNav({super.key});

  @override
  Widget build(BuildContext context) {
    final tabCtrl = Get.put(ClosetTabController());
    return Obx(
      () => Padding(
        padding: EdgeInsets.fromLTRB(24.w, 22.h, 24.w, 8.h),
        child: Row(
          children: [
            Expanded(
              child: NavTab(
                label: 'My Items',
                icon: AppLogos.clothes,
                active: tabCtrl.selectedTab.value == 0,
                onTap: () => tabCtrl.changeTab(0),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: NavTab(
                label: 'Templates',
                icon: AppLogos.template,
                active: tabCtrl.selectedTab.value == 1,
                onTap: () => tabCtrl.changeTab(1),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: NavTab(
                label: 'My Lists',
                icon: AppLogos.list,
                active: tabCtrl.selectedTab.value == 2,
                onTap: () => tabCtrl.changeTab(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
