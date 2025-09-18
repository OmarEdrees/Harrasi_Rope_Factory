import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/add_data.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/customers/models/customer_model.dart';
import 'package:harrasi_rope_factory/features/products/models/product_model.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/models/sale_invoice_model.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
part 'add_sale_invoice_state.dart';

class AddSaleInvoiceCubit extends Cubit<AddSaleInvoiceState> {
  AddSaleInvoiceCubit() : super(AddSaleInvoiceInitial()) {
    loadData();
  }

  // form key and controllers and variables
  final formKey = GlobalKey<FormState>();
  final supplierIdController = TextEditingController();
  final paymentMethodController = TextEditingController();
  final quantityController = TextEditingController(
    text: '1',
  );
  final subTotalController = TextEditingController();
  final discountController = TextEditingController();
  final taxController = TextEditingController();
  final totalController = TextEditingController();
  final notesController = TextEditingController();

  List<ProductModel> products = [];
  ProductModel? selectedProduct;
  DateTime? dueDate;
  List<CustomerModel> customers = [];

  // items of invoice
  List<SalesInvoiceItem> invoiceItems = [];

  loadData() async {
    await getProducts();
    await getCustomers();
  }

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

  getCustomers() async {
    try {
      emit(GetCustomersLoading());
      final response = await getData(tableName: 'customers');
      customers = response.map((e) => CustomerModel.fromJson(e)).toList();
      emit(GetCustomersSuccess());
    } on Exception catch (e) {
      emit(GetCustomersFailure(message: e.toString()));
    }
  }

  // add product to invoice
  addProductToInvoice(ProductModel product, double quantity) {
    if (product.currentStock < quantity) {
      emit(AddSaleInvoiceFailure(
        message: "${product.name} stock is less than $quantity",
      ));
      return;
    }
    final item = SalesInvoiceItem(product: product, quantity: quantity);
    invoiceItems.add(item);
    selectedProduct = null;
    quantityController.clear();
    quantityController.text = "1";
    calculateTotals();
    emit(AddSaleInvoiceItemsUpdated());
  }

  // remove product
  removeProductFromInvoice(int index) {
    invoiceItems.removeAt(index);
    calculateTotals();
    emit(AddSaleInvoiceItemsUpdated());
  }

  // calculate totals
  calculateTotals() {
    final subtotal = invoiceItems.fold<double>(
      0.0,
      (sum, item) => sum + item.total,
    );
    subTotalController.text = subtotal.toStringAsFixed(2);
    final tax = double.tryParse(taxController.text) ?? 0.0;
    final discount = double.tryParse(discountController.text) ?? 0.0;
    totalController.text = (subtotal + tax - discount).toStringAsFixed(2);
  }

  // add Sale invoice
  addSaleInvoice() async {
    if (formKey.currentState!.validate()) {
      if (dueDate == null) {
        emit(SelectDueDate());
        return;
      }
      if (supplierIdController.text.isEmpty) {
        emit(SelectCustomer());
        return;
      }
      if (paymentMethodController.text.isEmpty) {
        emit(SelectPaymentMethod());
        return;
      }
      if (invoiceItems.isEmpty) {
        emit(SelectProduct());
        return;
      }

      try {
        emit(AddSaleInvoiceLoading());
        final uuid = const Uuid().v4();
        await addData(tableName: "sales_invoices", data: {
          "id": uuid,
          "customer_id": supplierIdController.text,
          "payment_method": paymentMethodController.text,
          "subtotal": double.parse(subTotalController.text),
          "discount": double.parse(discountController.text),
          "tax": double.parse(taxController.text),
          "total": double.parse(totalController.text),
          "notes": notesController.text,
          'status': 'pending',
          "due_date": dueDate!.toIso8601String(),
          "date": DateTime.now().toIso8601String(),
          "created_at": DateTime.now().toIso8601String(),
          "updated_at": DateTime.now().toIso8601String(),
        });

        // save items
        for (final item in invoiceItems) {
          await addData(
              tableName: "sales_invoice_items", data: item.toJson(uuid));
        }

        emit(AddSaleInvoiceSuccess());
      } catch (e) {
        emit(AddSaleInvoiceFailure(message: e.toString()));
      }
    }
  }
}
