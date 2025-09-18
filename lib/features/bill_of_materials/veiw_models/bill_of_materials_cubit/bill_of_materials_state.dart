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
