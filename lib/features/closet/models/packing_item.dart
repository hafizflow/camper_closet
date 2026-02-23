import 'dart:ui';

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