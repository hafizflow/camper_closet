import 'package:flutter/material.dart';
import 'package:flutter_extension/features/closet/models/packing_item.dart';
import 'package:get/get.dart';

// ─── Controller ───────────────────────────────────────────────────────────────
class ItemDetailController extends GetxController {
  final PackingItem item;
  ItemDetailController({required this.item});
}

// ─── Screen ───────────────────────────────────────────────────────────────────
class ItemDetailScreen extends StatelessWidget {
  final PackingItem item;

  const ItemDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // ── Hero image + back button
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    // Image
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                      child: Image.network(
                        item.imageUrl,
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          height: 220,
                          color: const Color(0xFFEEF1F8),
                          child: const Icon(
                            Icons.image,
                            size: 60,
                            color: Color(0xFFB0BAD3),
                          ),
                        ),
                      ),
                    ),
                    // Back button
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.92),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 14,
                                  color: Color(0xFF2D3A5E),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Back to Items',
                                  style: TextStyle(
                                    color: Color(0xFF2D3A5E),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Category + menu
                      Row(
                        children: [
                          Text(
                            item.category.toUpperCase(),
                            style: const TextStyle(
                              color: Color(0xFF8E9BB5),
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.1,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.more_vert,
                            color: Color(0xFF8E9BB5),
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),

                      // ── Item name
                      Text(
                        item.name,
                        style: const TextStyle(
                          color: Color(0xFF1C2B4A),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // ── Quantity card
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F7FC),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'QUANTITY',
                              style: TextStyle(
                                color: Color(0xFF8E9BB5),
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.1,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '${item.quantity}',
                              style: const TextStyle(
                                color: Color(0xFF1C2B4A),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),

                      // ── Size / Color / Brand row
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F7FC),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            _AttributeCell(label: 'SIZE', value: item.size),
                            _VerticalDivider(),
                            _ColorCell(label: 'COLOR', color: item.dotColor),
                            _VerticalDivider(),
                            _AttributeCell(label: 'BRAND', value: item.brand),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // ── Usage & History
                      const Text(
                        'Usage & History',
                        style: TextStyle(
                          color: Color(0xFF1C2B4A),
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),

                      const Text(
                        'Used In',
                        style: TextStyle(
                          color: Color(0xFF8E9BB5),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),

                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: item.usedIn
                            .map((tag) => _TagChip(label: tag))
                            .toList(),
                      ),
                      const SizedBox(height: 16),

                      // ── Last Used
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F7FC),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              size: 16,
                              color: Color(0xFF8E9BB5),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Last Used',
                                  style: TextStyle(
                                    color: Color(0xFF8E9BB5),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item.lastUsed,
                                  style: const TextStyle(
                                    color: Color(0xFF1C2B4A),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // ── Shop Similar Item
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_bag_outlined,
                            size: 18,
                          ),
                          label: const Text(
                            'Shop Similar Item',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1A73E8),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // ── Add to Packing List
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.checklist_rounded, size: 18),
                          label: const Text(
                            'Add to Packing List',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF1C2B4A),
                            side: const BorderSide(color: Color(0xFFDDE3F0)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // ── Divider
                      const Divider(color: Color(0xFFEEF1F8)),
                      const SizedBox(height: 8),

                      // ── Edit Item Details
                      _TextActionButton(
                        icon: Icons.edit_outlined,
                        label: 'Edit Item Details',
                        color: const Color(0xFF1C2B4A),
                        onTap: () {},
                      ),
                      const SizedBox(height: 4),
                      const Divider(color: Color(0xFFEEF1F8)),
                      const SizedBox(height: 4),

                      // ── Delete Item
                      _TextActionButton(
                        icon: Icons.delete_outline_rounded,
                        label: 'Delete Item',
                        color: const Color(0xFFE53935),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Sub-widgets ──────────────────────────────────────────────────────────────

class _AttributeCell extends StatelessWidget {
  final String label;
  final String value;
  const _AttributeCell({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF8E9BB5),
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF1C2B4A),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorCell extends StatelessWidget {
  final String label;
  final Color color;
  const _ColorCell({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF8E9BB5),
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.4),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: 36, width: 1, color: const Color(0xFFDDE3F0));
  }
}

class _TagChip extends StatelessWidget {
  final String label;
  const _TagChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F0FE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF1A73E8),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _TextActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _TextActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

