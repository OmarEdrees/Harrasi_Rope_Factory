part of 'raw_materials_cubit.dart';

@immutable
sealed class RawMaterialsState {}

final class RawMaterialsInitial extends RawMaterialsState {}

final class GetRawMaterialsLoading extends RawMaterialsState {}

final class GetRawMaterialsSuccess extends RawMaterialsState {}

final class GetRawMaterialsError extends RawMaterialsState {
  final String error;
  GetRawMaterialsError({required this.error});
}

final class EmptyRawMaterials extends RawMaterialsState {}
// delete
final class DeleteRawMaterialLoading extends RawMaterialsState {}

final class DeleteRawMaterialSuccess extends RawMaterialsState {}

final class DeleteRawMaterialError extends RawMaterialsState {
  final String error;
  DeleteRawMaterialError({required this.error});
}