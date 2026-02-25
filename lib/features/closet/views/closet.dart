import 'package:flutter/material.dart';
import 'package:flutter_extension/features/closet/controllers/closet_tab_controller.dart';
import 'package:flutter_extension/features/closet/controllers/item_controller.dart';
import 'package:flutter_extension/features/closet/views/my_list_screen.dart';
import 'package:flutter_extension/features/closet/views/template_screen.dart';
import 'package:flutter_extension/features/closet/widgets/closet_header.dart';
import 'package:flutter_extension/features/closet/widgets/filterbar.dart';
import 'package:flutter_extension/features/closet/widgets/item_grid.dart';
import 'package:flutter_extension/features/closet/widgets/top_navbar.dart';
import 'package:get/get.dart';

class ClosetScreen extends StatelessWidget {
  const ClosetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsCtrl = Get.put(ItemsController());
    final tabCtrl = Get.put(ClosetTabController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ClosetHeader(),
            const TopNav(),
            Expanded(
              child: Obx(() {
                switch (tabCtrl.selectedTab.value) {
                  case 1:
                    return const TemplatesScreen();
                  case 2:
                    return const MyListsScreen();
                  default:
                    return Column(
                      children: [
                        FilterBar(ctrl: itemsCtrl),
                        Expanded(child: ItemsGrid(ctrl: itemsCtrl)),
                      ],
                    );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
