import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_extension/features/closet/widgets/nav_tab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNav extends StatelessWidget {
  const TopNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 22.h, 24.w, 8.h),
      child: Row(
        spacing: 10.w,
        children: const [
          NavTab(label: 'My Items', icon: AppLogos.clothes, active: true),
          NavTab(label: 'Templates', icon: AppLogos.template, active: false),
          NavTab(label: 'My Lists', icon: AppLogos.list, active: false),
        ],
      ),
    );
  }
}
