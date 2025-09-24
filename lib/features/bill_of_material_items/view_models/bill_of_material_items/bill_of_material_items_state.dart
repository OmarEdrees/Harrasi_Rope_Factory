part of 'bill_of_material_items_cubit.dart';

@immutable
sealed class BillOfMaterialItemsState {}

final class BillOfMaterialItemsInitial extends BillOfMaterialItemsState {}

final class GetBillOfMaterialItemsLoading extends BillOfMaterialItemsState {}

final class GetBillOfMaterialItemsSuccess extends BillOfMaterialItemsState {}

final class GetBillOfMaterialItemsFailure extends BillOfMaterialItemsState {
  final String errorMessage;
  GetBillOfMaterialItemsFailure({required this.errorMessage});
}

final class EmptyBillOfMaterialItems extends BillOfMaterialItemsState {}
