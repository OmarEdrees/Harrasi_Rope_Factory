part of 'add_bill_of_material_items_cubit.dart';

@immutable
sealed class AddBillOfMaterialItemsState {}

final class AddBillOfMaterialItemsInitial extends AddBillOfMaterialItemsState {}

final class AddBillOfMaterialItemsLoading extends AddBillOfMaterialItemsState {}

final class AddBillOfMaterialItemsSuccess extends AddBillOfMaterialItemsState {}

final class AddBillOfMaterialItemsFailure extends AddBillOfMaterialItemsState {
  final String error;
  AddBillOfMaterialItemsFailure({required this.error});
}
final class SelectRawMaterial extends AddBillOfMaterialItemsState {}
final class SelectUnit extends AddBillOfMaterialItemsState {}
// raw materials
final class GetRawMaterialsLoading extends AddBillOfMaterialItemsState {}

final class GetRawMaterialsSuccess extends AddBillOfMaterialItemsState {}

final class GetRawMaterialsError extends AddBillOfMaterialItemsState {
  final String error;
  GetRawMaterialsError({required this.error});
}

final class EmptyRawMaterials extends AddBillOfMaterialItemsState {}
