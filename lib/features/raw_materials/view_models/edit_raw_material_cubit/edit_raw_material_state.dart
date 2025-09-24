part of 'edit_raw_material_cubit.dart';

@immutable
sealed class EditRawMaterialState {}

final class EditRawMaterialInitial extends EditRawMaterialState {}
final class EditRawMaterialLoading extends EditRawMaterialState {}

final class EditRawMaterialSuccess extends EditRawMaterialState {}

final class EditRawMaterialFailure extends EditRawMaterialState {
  final String message;
  EditRawMaterialFailure({required this.message});
}

final class EditRawMaterialNoChanges extends EditRawMaterialState {}