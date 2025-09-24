part of 'bill_of_materials_cubit.dart';

@immutable
sealed class BillOfMaterialsState {}

final class BillOfMaterialsInitial extends BillOfMaterialsState {}

final class GetBillOfMaterialsLoading extends BillOfMaterialsState {}

final class GetBillOfMaterialsSuccess extends BillOfMaterialsState {}

final class GetBillOfMaterialsFailure extends BillOfMaterialsState {
  final String errorMessage;
  GetBillOfMaterialsFailure({required this.errorMessage});
}

final class EmptyBillOfMaterials extends BillOfMaterialsState {}
// delete bill of materials

final class DeleteBillOfMaterialLoading extends BillOfMaterialsState {}

final class DeleteBillOfMaterialSuccess extends BillOfMaterialsState {}

final class DeleteBillOfMaterialFailure extends BillOfMaterialsState {
  final String errorMessage;
  DeleteBillOfMaterialFailure({required this.errorMessage});
}
