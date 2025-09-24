part of 'edit_manufacture_cubit.dart';

@immutable
sealed class EditManufactureState {}

class EditManufactureInitial extends EditManufactureState {}

class EditManufactureLoading extends EditManufactureState {}

class EditManufactureSuccess extends EditManufactureState {}

class EditManufactureFailure extends EditManufactureState {
  final String message;
  EditManufactureFailure({required this.message});
}

class EditManufactureNoChanges extends EditManufactureState {}

class ChangeStatus extends EditManufactureState {}
