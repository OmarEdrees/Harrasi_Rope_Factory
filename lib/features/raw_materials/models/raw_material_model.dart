class RawMaterialModel {
  final String id;
  final String name;
  final String description;
  final String unit;
  final double currentStock;
  final DateTime createdAt;
  final DateTime updatedAt;

  RawMaterialModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.unit,
      required this.currentStock,
      required this.createdAt,
      required this.updatedAt});

  factory RawMaterialModel.fromJson(Map<String, dynamic> json) {
    return RawMaterialModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      unit: json['unit'],
      currentStock: json['current_stock'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
  toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'unit': unit,
      'current_stock': currentStock,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
