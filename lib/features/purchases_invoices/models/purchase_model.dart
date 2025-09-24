import 'dart:convert';

import 'package:harrasi_rope_factory/features/suppliers/models/supplier_model.dart';

class PurchaseInvoiceModel {
  final String id;
  final String supplierId;
  final int invoiceNumber;
  final DateTime date;
  final DateTime? dueDate;
  final String status;
  final String paymentMethod;
  final double subtotal;
  final double tax;
  final double discount;
  final double total;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SupplierModel? supplier;
  PurchaseInvoiceModel({
    required this.id,
    required this.supplierId,
    this.supplier,
    required this.invoiceNumber,
    required this.date,
    this.dueDate,
    required this.status,
    required this.paymentMethod,
    required this.subtotal,
    this.tax = 0,
    this.discount = 0,
    required this.total,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  /// from JSON
  factory PurchaseInvoiceModel.fromJson(Map<String, dynamic> json) {
    return PurchaseInvoiceModel(
      id: json['id'] as String,
      supplierId: json['supplier_id'] as String,
      invoiceNumber: json['invoice_number'] as int,
      date: DateTime.parse(json['date']),
      dueDate:
          json['due_date'] != null ? DateTime.tryParse(json['due_date']) : null,
      status: json['status'] as String,
      paymentMethod: json['payment_method'] as String,
      subtotal: (json['subtotal'] as num).toDouble(),
      tax: (json['tax'] ?? 0 as num).toDouble(),
      discount: (json['discount'] ?? 0 as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      notes: json['notes'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  /// to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'supplier_id': supplierId,
      'invoice_number': invoiceNumber,
      'date': date.toIso8601String(),
      'due_date': dueDate?.toIso8601String(),
      'status': status,
      'payment_method': paymentMethod,
      'subtotal': subtotal,
      'tax': tax,
      'discount': discount,
      'total': total,
      'notes': notes,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  copyWith({
    String? id,
    String? supplierId,
    int? invoiceNumber,
    DateTime? date,
    DateTime? dueDate,
    String? status,
    String? paymentMethod,
    double? subtotal,
    double? tax,
    double? discount,
    double? total,
    String? notes,
    SupplierModel? supplier,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PurchaseInvoiceModel(
      id: id ?? this.id,
      supplierId: supplierId ?? this.supplierId,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      date: date ?? this.date,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      subtotal: subtotal ?? this.subtotal,
      tax: tax ?? this.tax,
      supplier: supplier ?? this.supplier,
      discount: discount ?? this.discount,
      total: total ?? this.total,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// optional: for debugging
  @override
  String toString() => jsonEncode(toJson());
}
