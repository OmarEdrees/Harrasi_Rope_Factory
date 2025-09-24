part of 'add_raw_material_cubit.dart';

@immutable
sealed class AddRawMaterialState {}

final class AddRawMaterialInitial extends AddRawMaterialState {}

final class UnitNotSelected extends AddRawMaterialState {}

final class AddRawMaterialLoading extends AddRawMaterialState {}

final class AddRawMaterialSuccess extends AddRawMaterialState {}

final class AddRawMaterialsError extends AddRawMaterialState {
  final String error;
  AddRawMaterialsError({required this.error});
}
