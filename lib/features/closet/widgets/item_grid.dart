import 'package:flutter/material.dart';
import 'package:flutter_extension/features/closet/controllers/item_controller.dart';
import 'package:flutter_extension/features/closet/widgets/item_card.dart';
import 'package:get/get.dart';

class ItemsGrid extends StatelessWidget {
  final ItemsController ctrl;
  const ItemsGrid({super.key, required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (ctrl.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(color: Color(0xFF1A73E8)),
        );
      }

      final items = ctrl.filteredItems;
      if (items.isEmpty) {
        return const Center(
          child: Text(
            'No items found',
            style: TextStyle(color: Color(0xFF8E9BB5), fontSize: 15),
          ),
        );
      }

      return GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.82,
        ),
        itemCount: items.length,
        itemBuilder: (_, i) => ItemCard(item: items[i]),
      );
    });
  }
}
