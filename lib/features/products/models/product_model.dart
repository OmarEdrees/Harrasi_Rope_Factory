class ProductModel {
  final String id;
  final String categoryId;
  final String name;
  final String description;
  final String? image;
  final double purchasePrice;
  final double sellingPrice;
  final bool isManufactured;
  final String unit;
  final int minStockLevel;
  final double currentStock;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    this.image,
    required this.purchasePrice,
    required this.sellingPrice,
    required this.isManufactured,
    required this.unit,
    required this.minStockLevel,
    required this.currentStock,
    required this.createdAt,
    required this.updatedAt,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      description: json['description'],
      image: json['image'] ?? '',
      purchasePrice: json['purchase_price'],
      sellingPrice: json['selling_price'],
      isManufactured: json['is_manufactured'],
      unit: json['unit'],
      minStockLevel: json['min_stock_level'],
      currentStock: json['current_stock'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'categoryid': categoryId,
        'name': name,
        'description': description,
        'image': image,
        'purchasePrice': purchasePrice,
        'sellingPrice': sellingPrice,
        'isManufactured': isManufactured,
        'unit': unit,
        'minStockLevel': minStockLevel,
        'currentStock': currentStock,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}
