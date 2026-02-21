import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ── Demo data ────────────────────────────────────────────────────────────────

const List<Map<String, dynamic>> _demoItems = [
  {
    "id": 1,
    "name": "T-Shirts",
    "category": "Clothes",
    "brand": "GAP KIDS",
    "variant": "M",
    "quantity": 1,
    "color": 0xFF2196F3,
    "imageUrl":
        "https://images.unsplash.com/photo-1523381210434-271e8be1f52b?w=400&q=80",
  },
  {
    "id": 2,
    "name": "Hiking Boots",
    "category": "Shoes",
    "brand": "TREKKER",
    "variant": "8",
    "quantity": 1,
    "color": 0xFFE53935,
    "imageUrl":
        "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&q=80",
  },
  {
    "id": 3,
    "name": "Sunscreen SPF 50",
    "category": "Toiletries",
    "brand": "NEUTROGENA",
    "variant": "6OZ",
    "quantity": 1,
    "color": 0xFFFF9800,
    "imageUrl":
        "https://images.unsplash.com/photo-1556228453-efd6c1ff04f6?w=400&q=80",
  },
  {
    "id": 4,
    "name": "Sleeping Bag",
    "category": "Gear",
    "brand": "COLEMAN",
    "variant": "ADULT",
    "quantity": 1,
    "color": 0xFF43A047,
    "imageUrl":
        "https://images.unsplash.com/photo-1504280390367-361c6d9f38f4?w=400&q=80",
  },
  {
    "id": 5,
    "name": "Rain Jacket",
    "category": "Clothes",
    "brand": "COLUMBIA",
    "variant": "L",
    "quantity": 1,
    "color": 0xFF2196F3,
    "imageUrl":
        "https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=400&q=80",
  },
  {
    "id": 6,
    "name": "Shampoo",
    "category": "Toiletries",
    "brand": "HEAD & SHOULDERS",
    "variant": "12OZ",
    "quantity": 2,
    "color": 0xFFFF9800,
    "imageUrl":
        "https://images.unsplash.com/photo-1585232352617-c2d18b91b6e2?w=400&q=80",
  },
  {
    "id": 7,
    "name": "Headlamp",
    "category": "Gear",
    "brand": "BLACK DIAMOND",
    "variant": "325L",
    "quantity": 1,
    "color": 0xFF43A047,
    "imageUrl":
        "https://images.unsplash.com/photo-1504280390367-361c6d9f38f4?w=400&q=80",
  },
  {
    "id": 8,
    "name": "Compression Socks",
    "category": "Clothes",
    "brand": "DARN TOUGH",
    "variant": "M",
    "quantity": 3,
    "color": 0xFF2196F3,
    "imageUrl":
        "https://images.unsplash.com/photo-1586350977771-b3b0abd50c82?w=400&q=80",
  },
  {
    "id": 9,
    "name": "Toothbrush",
    "category": "Toiletries",
    "brand": "ORAL-B",
    "variant": "SOFT",
    "quantity": 1,
    "color": 0xFFFF9800,
    "imageUrl":
        "https://images.unsplash.com/photo-1559591937-abc68c8e9b8a?w=400&q=80",
  },
];

// ── Model ─────────────────────────────────────────────────────────────────────

class PackingItem {
  final int id;
  final String name;
  final String category;
  final String brand;
  final String variant;
  final int quantity;
  final Color dotColor;
  final String imageUrl;

  PackingItem({
    required this.id,
    required this.name,
    required this.category,
    required this.brand,
    required this.variant,
    required this.quantity,
    required this.dotColor,
    required this.imageUrl,
  });

  factory PackingItem.fromJson(Map<String, dynamic> json) => PackingItem(
    id: json['id'],
    name: json['name'],
    category: json['category'],
    brand: json['brand'],
    variant: json['variant'],
    quantity: json['quantity'],
    dotColor: Color(json['color']),
    imageUrl: json['imageUrl'],
  );
}

// ── Controller ────────────────────────────────────────────────────────────────

class ItemsController extends GetxController {
  final RxList<PackingItem> allItems = <PackingItem>[].obs;
  final RxString selectedFilter = 'All'.obs;
  final RxBool isLoading = true.obs;

  List<String> get filterTabs {
    final cats = allItems.map((e) => e.category).toSet().toList()..sort();
    return ['All', ...cats];
  }

  List<PackingItem> get filteredItems {
    if (selectedFilter.value == 'All') return allItems;
    return allItems.where((e) => e.category == selectedFilter.value).toList();
  }

  int countFor(String filter) {
    if (filter == 'All') return allItems.length;
    return allItems.where((e) => e.category == filter).length;
  }

  @override
  void onInit() {
    super.onInit();
    _loadItems();
  }

  Future<void> _loadItems() async {
    isLoading.value = true;
    // Simulate network delay — swap with http.get(yourApiUrl) later
    await Future.delayed(const Duration(milliseconds: 600));
    allItems.assignAll(
      _demoItems.map((json) => PackingItem.fromJson(json)).toList(),
    );
    isLoading.value = false;
  }

  void setFilter(String filter) => selectedFilter.value = filter;
}

// ── Widget ────────────────────────────────────────────────────────────────────

class MyItemsPage extends StatelessWidget {
  const MyItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Register controller; safe to call multiple times
    final ctrl = Get.put(ItemsController());

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TopNav(),
            _FilterBar(ctrl: ctrl),
            Expanded(child: _ItemsGrid(ctrl: ctrl)),
          ],
        ),
      ),
    );
  }
}

// ── Top navigation tabs ──────────────────────────────────────────────────────

class _TopNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(4),
        child: const Row(
          children: [
            _NavTab(
              label: 'My Items',
              icon: Icons.checkroom_outlined,
              active: true,
            ),
            _NavTab(
              label: 'Templates',
              icon: Icons.layers_outlined,
              active: false,
            ),
            _NavTab(
              label: 'My Lists',
              icon: Icons.list_alt_outlined,
              active: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavTab extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool active;

  const _NavTab({
    required this.label,
    required this.icon,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF1A73E8) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: active ? Colors.white : const Color(0xFF8E9BB5),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: active ? Colors.white : const Color(0xFF8E9BB5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Filter chips bar ─────────────────────────────────────────────────────────

class _FilterBar extends StatelessWidget {
  final ItemsController ctrl;
  const _FilterBar({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final tabs = ctrl.filterTabs;
      return SizedBox(
        height: 52,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          scrollDirection: Axis.horizontal,
          itemCount: tabs.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (_, i) {
            final tab = tabs[i];
            final active = ctrl.selectedFilter.value == tab;
            final count = ctrl.countFor(tab);
            return GestureDetector(
              onTap: () => ctrl.setFilter(tab),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: active ? const Color(0xFF1A73E8) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: active
                      ? [
                          BoxShadow(
                            color: const Color(0xFF1A73E8).withOpacity(0.30),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                ),
                child: Row(
                  children: [
                    Text(
                      tab,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: active ? Colors.white : const Color(0xFF4A5568),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: active
                            ? Colors.white.withOpacity(0.25)
                            : const Color(0xFFEEF2FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '$count',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: active
                              ? Colors.white
                              : const Color(0xFF1A73E8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}

// ── Items grid ───────────────────────────────────────────────────────────────

class _ItemsGrid extends StatelessWidget {
  final ItemsController ctrl;
  const _ItemsGrid({required this.ctrl});

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
        itemBuilder: (_, i) => _ItemCard(item: items[i]),
      );
    });
  }
}

// ── Single item card ─────────────────────────────────────────────────────────

class _ItemCard extends StatelessWidget {
  final PackingItem item;
  const _ItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Image area
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFFEEF2FF),
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        color: Color(0xFFB0BEC5),
                        size: 36,
                      ),
                    ),
                  ),
                  // category badge
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.10),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Text(
                        item.category.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.6,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                    ),
                  ),
                  // quantity badge
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1A1A2E),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          'x${item.quantity}',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ── Text area
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: item.dotColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '${item.brand} • ${item.variant}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF8E9BB5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
