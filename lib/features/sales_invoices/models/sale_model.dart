import 'dart:convert';
import 'package:harrasi_rope_factory/features/customers/models/customer_model.dart';

class SaleInvoiceModel {
  final String id;
  final String customerId;
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
  final CustomerModel? customer;
  SaleInvoiceModel({
    required this.id,
    required this.customerId,
    this.customer,
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
  factory SaleInvoiceModel.fromJson(Map<String, dynamic> json) {
    return SaleInvoiceModel(
      id: json['id'] as String,
      customerId: json['customer_id'] as String,
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
      'customer_id': customerId,
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
    String? customerId,
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
    CustomerModel? customer,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SaleInvoiceModel(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      date: date ?? this.date,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      subtotal: subtotal ?? this.subtotal,
      tax: tax ?? this.tax,
      customer: customer ?? this.customer,
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
