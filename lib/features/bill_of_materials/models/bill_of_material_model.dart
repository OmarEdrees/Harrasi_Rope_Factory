import 'package:harrasi_rope_factory/features/products/models/product_model.dart';

class BillOfMaterialModel {
  final String id;
  final String productId;
  final String name;
  final String description;
  final ProductModel? product;
  final DateTime createdAt;
  final DateTime updatedAt;

  BillOfMaterialModel({
    required this.id,
    required this.productId,
    required this.name,
    required this.description,
    this.product,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BillOfMaterialModel.fromJson(Map<String, dynamic> json) =>
      BillOfMaterialModel(
        id: json['id'],
        productId: json['product_id'],
        name: json['name'],
        description: json['description'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_id': productId,
        'name': name,
        'description': description,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
  copyWith({
    String? id,
    String? productId,
    String? name,
    String? description,
    ProductModel? product,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      BillOfMaterialModel(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        name: name ?? this.name,
        description: description ?? this.description,
        product: product ?? this.product,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}
