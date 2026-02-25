// template_model.dart
class TemplateModel {
  final String id;
  final String title;
  final String subtitle;
  final int itemCount;
  final String iconCategory; // 'camp', 'travel', 'gear', etc.

  const TemplateModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.itemCount,
    required this.iconCategory,
  });
}