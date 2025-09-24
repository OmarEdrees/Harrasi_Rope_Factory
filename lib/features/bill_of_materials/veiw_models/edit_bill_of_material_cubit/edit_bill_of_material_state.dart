part of 'edit_bill_of_material_cubit.dart';

@immutable
sealed class EditBillOfMaterialState {}

final class EditBillOfMaterialInitial extends EditBillOfMaterialState {}

final class EditBillOfMaterialLoading extends EditBillOfMaterialState {}

final class EditBillOfMaterialSuccess extends EditBillOfMaterialState {
  
}
final class EditBillOfMaterialFailure extends EditBillOfMaterialState {
  final String errorMessage;
  EditBillOfMaterialFailure({required this.errorMessage});
}
final class EditBillOfMaterialNoChanges extends EditBillOfMaterialState {}