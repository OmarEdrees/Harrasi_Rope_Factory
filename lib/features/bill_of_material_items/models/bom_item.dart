
class BOMItemModel{
  final String id;
  final String bomId;
  final String rawMaterialId;
  final String unit;
  final double quantity;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String ? rawMaterialName;
  const BOMItemModel({
    this.rawMaterialName,
    required this.id,
    required this.bomId,
    required this.unit,
    required this.rawMaterialId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BOMItemModel.fromJson(Map<String, dynamic> json) {
    return BOMItemModel(
      id: json['id'] as String,
      bomId: json['bom_id'] as String,
      unit: json['unit'] as String,
      rawMaterialId: json['raw_material_id'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bom_id': bomId,
      'unit': unit,
      'raw_material_id': rawMaterialId,
      'quantity': quantity,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
  copyWith({
    String? id,
    String? bomId,
    String? rawMaterialName,
    String? unit,
    String? rawMaterialId,
    double? quantity,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return BOMItemModel(
      id: id ?? this.id,
      bomId: bomId ?? this.bomId,
      unit: unit ?? this.unit,
      rawMaterialName: rawMaterialName ?? this.rawMaterialName,
      rawMaterialId: rawMaterialId ?? this.rawMaterialId,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
