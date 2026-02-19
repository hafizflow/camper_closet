import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_extension/features/nav/controllers/nav_controller.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  // How much the scan button overflows above the bar
  static const double _fabSize = 60.0;
  static const double _fabOverlap = 20.0;
  static const double _barHeight = 64.0;

  @override
  Widget build(BuildContext context) {
    final NavController ctrl = Get.find<NavController>();

    return Obx(() {
      final selected = ctrl.selectedTab.value;

      return SizedBox(
        height: _barHeight + _fabOverlap,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
                child: SafeArea(
                  top: false,
                  child: SizedBox(
                    height: _barHeight,
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        _NavItem(
                          icon: AppLogos.home,
                          label: 'Home',
                          isSelected: selected == 0,
                          onTap: () => ctrl.changeTab(0),
                        ),
                        _NavItem(
                          icon: AppLogos.closet,
                          label: 'Closet',
                          isSelected: selected == 1,
                          onTap: () => ctrl.changeTab(1),
                        ),
                        SizedBox(width: 80.w),
                        _NavItem(
                          icon: AppLogos.navcalendar,
                          label: 'Calendar',
                          isSelected: selected == 2,
                          onTap: () => ctrl.changeTab(2),
                        ),
                        _NavItem(
                          icon: AppLogos.user,
                          label: 'Profile',
                          isSelected: selected == 3,
                          onTap: () => ctrl.changeTab(3),
                        ),
                        const SizedBox(width: 12),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ── Floating scan button — centered, overflows upward ────────────
            Positioned(
              bottom: _barHeight - _fabSize / 2 + _fabOverlap,
              child: GestureDetector(
                onTap: ctrl.onScanPressed,
                child: Container(
                  width: _fabSize + 8,
                  height: _fabSize + 8,
                  decoration: BoxDecoration(
                    color: AppColors.buttonPrimaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SvgPicture.asset(
                      AppLogos.scan,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

// ─── Reusable nav item ───────────────────────────────────────────────────────

class _NavItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  static final _activeColor = AppColors.buttonPrimaryColor;
  static final _inactiveColor = AppColors.primaryText;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? _activeColor : _inactiveColor;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              width: 24,
              height: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: color,
                fontSize: 11.sp.clamp(9.0, 13.0),
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
