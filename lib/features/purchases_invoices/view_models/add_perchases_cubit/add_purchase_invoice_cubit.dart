import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/add_data.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/products/models/product_model.dart';
import 'package:harrasi_rope_factory/features/suppliers/models/supplier_model.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
part 'add_purchase_invoice_state.dart';

class InvoiceItem {
  final dynamic item; // ProductModel or RawMaterialModel
  final String itemType; // 'product' or 'raw_material'
  final double quantity;
  final double unitPrice;
  final double total;

  InvoiceItem({
    required this.item,
    required this.itemType,
    required this.quantity,
  }) : unitPrice = itemType == 'product'
            ? (item as ProductModel).purchasePrice
            : (item as RawMaterialModel).unitPrice,
        total = quantity * (itemType == 'product'
            ? (item as ProductModel).purchasePrice
            : (item as RawMaterialModel).unitPrice);

  Map<String, dynamic> toJson(String invoiceId) {
    return {
      'invoice_id': invoiceId,
      if (itemType == 'product') 'product_id': (item as ProductModel).id else 'raw_material_id': (item as RawMaterialModel).id,
      'quantity': quantity,
      'description': itemType == 'product' ? (item as ProductModel).description : (item as RawMaterialModel).description,
      'unit_price': unitPrice,
      'total': total,
      'created_at': DateTime.now().toIso8601String(),
    };
  }
}
class RawMaterialModel {
  final String id;
  final String name;
  final String description;
  final String unit;
  final double unitPrice; // Added for pricing
  final double currentStock;
  final DateTime createdAt;
  final DateTime updatedAt;

  RawMaterialModel({
    required this.id,
    required this.name,
    required this.description,
    required this.unit,
    required this.unitPrice,
    required this.currentStock,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RawMaterialModel.fromJson(Map<String, dynamic> json) {
    return RawMaterialModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      unit: json['unit'],
      unitPrice: json['unit_price'] ?? 0.0, // Adjust based on database schema
      currentStock: json['current_stock'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'unit': unit,
      'unit_price': unitPrice,
      'current_stock': currentStock,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class AddPurchaseInvoiceCubit extends Cubit<AddPurchaseInvoiceState> {
  AddPurchaseInvoiceCubit() : super(AddPurchaseInvoiceInitial()) {
    loadData();
  }

  // Form key, controllers, and variables
  final formKey = GlobalKey<FormState>();
  final supplierIdController = TextEditingController();
  final invoiceNumberController = TextEditingController();
  final paymentMethodController = TextEditingController();
  final productQuantityController = TextEditingController();
  final rawMaterialQuantityController = TextEditingController();
  final subTotalController = TextEditingController();
  final discountController = TextEditingController();
  final taxController = TextEditingController();
  final totalController = TextEditingController();
  final notesController = TextEditingController();

  DateTime? dueDate;
  List<SupplierModel> suppliers = [];
  List<RawMaterialModel> rawMaterials = [];
  List<ProductModel> products = [];
  List<InvoiceItem> productInvoiceItems = [];
  List<InvoiceItem> rawMaterialInvoiceItems = [];
  ProductModel? selectedProduct;
  RawMaterialModel? selectedRawMaterial;

  // Load data
  loadData() async {
    await getSuppliers();
    await getProducts();
    await getMaterials();
  }

  // Get suppliers
  getSuppliers() async {
    try {
      emit(GetSuppliersLoading());
      final response = await getData(tableName: 'suppliers');
      suppliers = response.map((e) => SupplierModel.fromJson(e)).toList();
      emit(GetSuppliersSuccess());
    } catch (e) {
      emit(GetSuppliersFailure(message: e.toString()));
    }
  }

  // Get products
  getProducts() async {
    try {
      emit(GetProductsLoading());
      final response = await getData(tableName: 'products');
      products = response.map((e) => ProductModel.fromJson(e)).toList();
      emit(GetProductsSuccess());
    } catch (e) {
      emit(GetProductsFailure(message: e.toString()));
    }
  }

  // Get raw materials
  getMaterials() async {
    try {
      emit(GetRawMaterialsLoading());
      final response = await getData(tableName: 'raw_materials');
      rawMaterials = response.map((e) => RawMaterialModel.fromJson(e)).toList();
      emit(GetRawMaterialsSuccess());
    } catch (e) {
      emit(GetRawMaterialsFailure(message: e.toString()));
    }
  }

  // Add product to invoice
  addProductToInvoice(ProductModel product, double quantity) {
    if (quantity <= 0) {
      emit(AddPurchaseInvoiceFailure(message: 'Please enter a valid quantity'));
      return;
    }
    final item = InvoiceItem(
      item: product,
      itemType: 'product',
      quantity: quantity,
    );
    productInvoiceItems.add(item);
    selectedProduct = null;
    productQuantityController.clear();
    calculateTotals();
    emit(AddPurchaseInvoiceItemsUpdated());
  }

  // Remove product from invoice
  removeProductFromInvoice(int index) {
    productInvoiceItems.removeAt(index);
    calculateTotals();
    emit(AddPurchaseInvoiceItemsUpdated());
  }

  // Add raw material to invoice
  addRawMaterialToInvoice(RawMaterialModel rawMaterial, double quantity) {
    if (quantity <= 0) {
      emit(AddPurchaseInvoiceFailure(message: 'Please enter a valid quantity'));
      return;
    }
    final item = InvoiceItem(
      item: rawMaterial,
      itemType: 'raw_material',
      quantity: quantity,
    );
    rawMaterialInvoiceItems.add(item);
    selectedRawMaterial = null;
    rawMaterialQuantityController.clear();
    calculateTotals();
    emit(AddPurchaseInvoiceItemsUpdated());
  }

  // Remove raw material from invoice
  removeRawMaterialFromInvoice(int index) {
    rawMaterialInvoiceItems.removeAt(index);
    calculateTotals();
    emit(AddPurchaseInvoiceItemsUpdated());
  }

  // Calculate totals
  calculateTotals() {
    final subtotal = [
      ...productInvoiceItems,
      ...rawMaterialInvoiceItems,
    ].fold<double>(
      0.0,
      (sum, item) => sum + item.total,
    );
    subTotalController.text = subtotal.toStringAsFixed(2);
    final tax = double.tryParse(taxController.text) ?? 0.0;
    final discount = double.tryParse(discountController.text) ?? 0.0;
    totalController.text = (subtotal + tax - discount).toStringAsFixed(2);
    emit(UpdateTotal());
  }

  // Add purchase invoice
  addPurchaseInvoice() async {
    if (formKey.currentState!.validate()) {
      if (dueDate == null) {
        emit(SelectDueDate());
        return;
      }
      if (supplierIdController.text.isEmpty) {
        emit(SelectSupplier());
        return;
      }
      if (paymentMethodController.text.isEmpty) {
        emit(SelectPaymentMethod());
        return;
      }
      if (productInvoiceItems.isEmpty && rawMaterialInvoiceItems.isEmpty) {
        emit(SelectItem());
        return;
      }

      try {
        emit(AddPurchaseInvoiceLoading());
        final uuid = const Uuid().v4();
        await addData(tableName: 'purchase_invoices', data: {
          'id': uuid,
          'supplier_id': supplierIdController.text,
          'payment_method': paymentMethodController.text,
          'subtotal': double.parse(subTotalController.text),
          'discount': double.parse(discountController.text),
          'tax': double.parse(taxController.text),
          'total': double.parse(totalController.text),
          'notes': notesController.text,
          'status': 'pending',
          'due_date': dueDate!.toIso8601String(),
          'date': DateTime.now().toIso8601String(),
          'created_at': DateTime.now().toIso8601String(),
          'updated_at': DateTime.now().toIso8601String(),
        });

        // Save all invoice items (products and raw materials)
        for (final item in [...productInvoiceItems, ...rawMaterialInvoiceItems]) {
          await addData(
            tableName: 'purchase_invoice_items',
            data: item.toJson(uuid),
          );
        }

        emit(AddPurchaseInvoiceSuccess());
      } catch (e) {
        emit(AddPurchaseInvoiceFailure(message: e.toString()));
      }
    }
  }
}