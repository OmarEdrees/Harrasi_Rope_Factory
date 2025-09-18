part of 'add_purchase_invoice_cubit.dart';

@immutable
sealed class AddPurchaseInvoiceState {}

class AddPurchaseInvoiceInitial extends AddPurchaseInvoiceState {}

class GetSuppliersLoading extends AddPurchaseInvoiceState {}

class GetSuppliersSuccess extends AddPurchaseInvoiceState {}

class GetSuppliersFailure extends AddPurchaseInvoiceState {
  final String message;
  GetSuppliersFailure({required this.message});
}

class GetProductsLoading extends AddPurchaseInvoiceState {}

class GetProductsSuccess extends AddPurchaseInvoiceState {}

class GetProductsFailure extends AddPurchaseInvoiceState {
  final String message;
  GetProductsFailure({required this.message});
}

class GetRawMaterialsLoading extends AddPurchaseInvoiceState {}

class GetRawMaterialsSuccess extends AddPurchaseInvoiceState {}

class GetRawMaterialsFailure extends AddPurchaseInvoiceState {
  final String message;
  GetRawMaterialsFailure({required this.message});
}

class AddPurchaseInvoiceItemsUpdated extends AddPurchaseInvoiceState {}

class AddPurchaseInvoiceLoading extends AddPurchaseInvoiceState {}

class AddPurchaseInvoiceSuccess extends AddPurchaseInvoiceState {}

class AddPurchaseInvoiceFailure extends AddPurchaseInvoiceState {
  final String message;
  AddPurchaseInvoiceFailure({required this.message});
}

class SelectDueDate extends AddPurchaseInvoiceState {}

class SelectSupplier extends AddPurchaseInvoiceState {}

class SelectPaymentMethod extends AddPurchaseInvoiceState {}

class SelectItem extends AddPurchaseInvoiceState {}

class UpdateTotal extends AddPurchaseInvoiceState {}