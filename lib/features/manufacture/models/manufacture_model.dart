import 'package:harrasi_rope_factory/features/products/models/product_model.dart';

class ManufactureModel {
  final String id;
  final String productId;
  final String bomId;
  final int quantity;
  final String status;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ProductModel? product;
  ManufactureModel({
    required this.id,
    required this.productId,
    required this.bomId,
    required this.quantity,
    required this.status,
    this.startDate,
    this.endDate,
    this.notes,
    this.product,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ManufactureModel.fromJson(Map<String, dynamic> json) {
    return ManufactureModel(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      bomId: json['bom_id'] as String,
      quantity: json['quantity'] as int,
      status: json['status'] ?? 'pending',
      startDate:
          json['start_date'] != null ? DateTime.parse(json['start_date']) : null,
      endDate:
          json['end_date'] != null ? DateTime.parse(json['end_date']) : null,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'bom_id': bomId,
      'quantity': quantity,
      'status': status,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'notes': notes,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
  copyWith({
    String? id,
    String? productId,
    String? bomId,
    int? quantity,
    String? status,
    DateTime? startDate,
    DateTime? endDate,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    ProductModel? product
  }) {
    return ManufactureModel(
      product: product ?? this.product,
      id: id ?? this.id,
      productId: productId ?? this.productId,
      bomId: bomId ?? this.bomId,
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
}
}