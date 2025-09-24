part of 'add_supplier_cubit.dart';

@immutable
sealed class AddSupplierState {}

final class AddSupplierInitial extends AddSupplierState {}

final class AddSupplierLoading extends AddSupplierState {}

final class AddSupplierSuccess extends AddSupplierState {}

final class AddSupplierFailure extends AddSupplierState {
  final String message;
  AddSupplierFailure({required this.message});
}
//
final class SelectContactPerson extends AddSupplierState {}

final class SelectPaymentTerm extends AddSupplierState {}
