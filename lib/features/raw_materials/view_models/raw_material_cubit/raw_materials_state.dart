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
