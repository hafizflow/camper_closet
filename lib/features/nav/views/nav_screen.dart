import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/core/constants/app_colors.dart';
import 'package:flutter_extension/core/constants/app_logos.dart';
import 'package:flutter_extension/features/calendar/views/calendar_screen.dart';
import 'package:flutter_extension/features/closet/views/closet.dart';
import 'package:flutter_extension/features/nav/widgets/navbar.dart';
import 'package:flutter_extension/features/profile/views/profile_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_extension/features/nav/controllers/nav_controller.dart';
import 'package:flutter_extension/features/home/views/home_screen.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavController ctrl = Get.find<NavController>();

    // Swap placeholders with real screens as you build them
    final List<Widget> pages = [
      const HomeScreen(),
      const ClosetScreen(),
      const CalendarScreen(),
      const ProfileScreen(),
    ];

    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          ctrl.handleBackPress();
        }
      },
      child: Obx(
        () => Scaffold(
          backgroundColor: Colors.white,
          body: IndexedStack(
            index: ctrl.selectedTab.value,
            children: List.generate(pages.length, (i) {
              return Navigator(
                key: ctrl.navKeys[i],
                onGenerateInitialRoutes: (_, __) => [
                  MaterialPageRoute(builder: (_) => pages[i]),
                ],
              );
            }),
          ),
          bottomNavigationBar: const NavBar(),
          floatingActionButton: SizedBox(
            width: 68,
            height: 68,
            child: FloatingActionButton(
              onPressed: ctrl.onScanPressed,
              elevation: 0,
              highlightElevation: 0,
              backgroundColor: AppColors.buttonPrimaryColor,
              shape: const CircleBorder(
                side: BorderSide(color: Colors.white, width: 4),
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
          ).paddingBottom(0),

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
