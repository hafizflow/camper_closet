import 'package:flutter_extension/features/closet/demoItems.dart';
import 'package:flutter_extension/features/closet/models/packing_item.dart';
import 'package:get/get.dart';

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
      demoItems.map((json) => PackingItem.fromJson(json)).toList(),
    );
    isLoading.value = false;
  }

  void setFilter(String filter) => selectedFilter.value = filter;
}
