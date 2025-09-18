part of 'add_bill_of_material_cubit.dart';

@immutable
sealed class AddBillOfMaterialState {}

// products
final class AddBillOfMaterialInitial extends AddBillOfMaterialState {}

final class GetProductsLoading extends AddBillOfMaterialState {}

final class GetProductsSuccess extends AddBillOfMaterialState {}

final class GetProductsError extends AddBillOfMaterialState {
  final String message;
  GetProductsError({required this.message});
}

final class EmptyProducts extends AddBillOfMaterialState {}
// selected product
final class SelectProduct extends AddBillOfMaterialState {}
// add bill of material
final class AddBillOfMaterialSuccess extends AddBillOfMaterialState {}
final class AddBillOfMaterialError extends AddBillOfMaterialState {
  final String errorMessage;
  AddBillOfMaterialError({required this.errorMessage});
}
final class AddBillOfMaterialLoading extends AddBillOfMaterialState {}
