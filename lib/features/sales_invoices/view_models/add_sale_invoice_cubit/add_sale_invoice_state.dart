part of 'add_sale_invoice_cubit.dart';

@immutable
sealed class AddSaleInvoiceState {}

final class AddSaleInvoiceInitial extends AddSaleInvoiceState {}


final class AddSaleInvoiceLoading extends AddSaleInvoiceState {}

final class AddSaleInvoiceSuccess extends AddSaleInvoiceState {}

final class AddSaleInvoiceFailure extends AddSaleInvoiceState {
  final String message;
  AddSaleInvoiceFailure({required this.message});
}
final class AddSaleInvoiceItemsUpdated extends AddSaleInvoiceState {}
//
final class SelectDueDate extends AddSaleInvoiceState {}

final class SelectCustomer extends AddSaleInvoiceState {}

final class SelectPaymentMethod extends AddSaleInvoiceState {}

final class UploadTotal extends AddSaleInvoiceState {}

final class SelectProduct extends AddSaleInvoiceState {}

final class UploadSubTotal extends AddSaleInvoiceState {}

// get customers
final class GetCustomersLoading extends AddSaleInvoiceState {}

final class GetCustomersSuccess extends AddSaleInvoiceState {}

final class GetCustomersFailure extends AddSaleInvoiceState {
  final String message;
  GetCustomersFailure({required this.message});
}
//
final class GetProductsLoading extends AddSaleInvoiceState {}
final class GetProductsEmpty extends AddSaleInvoiceState {}
final class GetProductsSuccess extends AddSaleInvoiceState {}
final class GetProductsFailure extends AddSaleInvoiceState {
  final String message;
  GetProductsFailure({required this.message});
}