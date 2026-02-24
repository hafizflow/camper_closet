import 'package:flutter/material.dart';
import 'package:flutter_extension/features/closet/controllers/item_controller.dart';
import 'package:flutter_extension/features/closet/widgets/closet_header.dart';
import 'package:flutter_extension/features/closet/widgets/filterbar.dart';
import 'package:flutter_extension/features/closet/widgets/item_grid.dart';
import 'package:flutter_extension/features/closet/widgets/top_navbar.dart';
import 'package:get/get.dart';

class ClosetScreen extends StatelessWidget {
  const ClosetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(ItemsController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ClosetHeader(),
            const TopNav(),
            FilterBar(ctrl: ctrl),
            Expanded(child: ItemsGrid(ctrl: ctrl)),
          ],
        ),
      ),
    );
  }
}
