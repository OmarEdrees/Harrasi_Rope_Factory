part of 'sales_invoices_cubit.dart';

@immutable
sealed class SalesInvoicesState {}

final class SalesInvoicesInitial extends SalesInvoicesState {}
final class GetSalesInvoicesLoading extends SalesInvoicesState {}

final class GetSalesInvoicesSuccess extends SalesInvoicesState {}

final class GetSalesInvoicesFailure extends SalesInvoicesState {
  final String message;
  GetSalesInvoicesFailure({required this.message});
}

final class EmptySalesInvoices extends SalesInvoicesState {}
