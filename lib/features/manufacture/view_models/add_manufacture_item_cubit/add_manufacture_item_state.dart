part of 'add_manufacture_item_cubit.dart';

@immutable
sealed class AddManufactureItemState {}

final class AddManufactureItemInitial extends AddManufactureItemState {}

final class AddManufactureItemLoading extends AddManufactureItemState {}

final class AddManufactureItemSuccess extends AddManufactureItemState {}

final class AddManufactureItemFailure extends AddManufactureItemState {
  final String errorMessage;
  AddManufactureItemFailure({required this.errorMessage});
}

//
final class SelectBillOfMaterial extends AddManufactureItemState {}

final class SelectProduct extends AddManufactureItemState {}

final class SelectStartDate extends AddManufactureItemState {}

final class SelectEndDate extends AddManufactureItemState {}

// bill of materials
final class GetBillOfMaterialsLoading extends AddManufactureItemState {}

final class GetBillOfMaterialsSuccess extends AddManufactureItemState {}

final class GetBillOfMaterialsFailure extends AddManufactureItemState {
  final String errorMessage;
  GetBillOfMaterialsFailure({required this.errorMessage});
}

final class EmptyBillOfMaterials extends AddManufactureItemState {}

// product
final class GetProductsLoading extends AddManufactureItemState {}

final class GetProductsEmpty extends AddManufactureItemState {}

final class GetProductsSuccess extends AddManufactureItemState {}

final class GetProductsFailure extends AddManufactureItemState {
  final String message;
  GetProductsFailure({required this.message});
}
