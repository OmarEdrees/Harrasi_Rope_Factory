part of 'edit_supplier_cubit.dart';

@immutable
sealed class EditSupplierState {}

final class EditSupplierInitial extends EditSupplierState {}
final class EditSupplierLoading extends EditSupplierState {}
final class EditSupplierSuccess extends EditSupplierState {}
final class EditSupplierFailure extends EditSupplierState {
  final String message;
  EditSupplierFailure({required this.message});
}
final class EditSupplierNoChanges extends EditSupplierState {}