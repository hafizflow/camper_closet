// templates_controller.dart
import 'package:get/get.dart';
import '../models/template_model.dart';

class TemplatesController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxList<TemplateModel> templates = <TemplateModel>[].obs;
  final RxString selectedFilter = 'All'.obs;

  final filters = ['All', 'Camp', 'Travel', 'Gear', 'School'];

  List<TemplateModel> get filteredTemplates {
    if (selectedFilter.value == 'All') return templates;
    return templates
        .where(
          (t) =>
              t.iconCategory.toLowerCase() ==
              selectedFilter.value.toLowerCase(),
        )
        .toList();
  }

  @override
  void onInit() {
    super.onInit();
    _loadTemplates();
  }

  Future<void> _loadTemplates() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 400));
    templates.assignAll([
      const TemplateModel(
        id: '1',
        title: '7-Day Summer Camp',
        subtitle: 'Perfect for overnight camps',
        itemCount: 42,
        iconCategory: 'camp',
      ),
      const TemplateModel(
        id: '2',
        title: 'Weekend Ski Trip',
        subtitle: 'Slopes & lodge essentials',
        itemCount: 28,
        iconCategory: 'travel',
      ),
      const TemplateModel(
        id: '3',
        title: 'School Year Starter',
        subtitle: 'Back to school basics',
        itemCount: 35,
        iconCategory: 'school',
      ),
      const TemplateModel(
        id: '4',
        title: 'Hiking Adventure',
        subtitle: 'Trail-ready gear list',
        itemCount: 31,
        iconCategory: 'gear',
      ),
    ]);
    isLoading.value = false;
  }

  void useTemplate(TemplateModel template) {
    // TODO: create a packing list from this template
  }
}
