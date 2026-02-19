import 'package:flutter/material.dart';
import 'package:flutter_extension/features/nav/widgets/navbar.dart';
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
      const _Placeholder(label: 'Closet'),
      const _Placeholder(label: 'Calendar'),
      const _Placeholder(label: 'Profile'),
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
        ),
      ),
    );
  }
}

// ─── Temporary placeholder — delete once real screens exist ──────────────────
class _Placeholder extends StatelessWidget {
  final String label;
  const _Placeholder({required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(label), elevation: 0),
      body: Center(child: Text(label, style: const TextStyle(fontSize: 24))),
    );
  }
}
